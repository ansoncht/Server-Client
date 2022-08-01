// package name
package main

// imports
import (
	"context"
	"log"
	"net"
	"os"

	pb "github.com/ansoncht/server-client/protos"
	"github.com/jackc/pgx/v4"
	"github.com/joho/godotenv"

	"google.golang.org/grpc"
)

// constants
const (
	port = ":5001"
)

// UserManagementServer struct
type UserManagementServer struct {
	conn *pgx.Conn
	pb.UnimplementedUserManagementServer
}

// function NewUserManagementServer() creates a new UserManagementServer with an empty list for created users
func NewUserManagementServer() *UserManagementServer {
	// return a new UserManagementServer with user_list initialized
	return &UserManagementServer{}
}

// function Run() creates a new gRPC server
func (server *UserManagementServer) Run() error {
	// listen to the port specified
	lis, err := net.Listen("tcp", port)
	// log errors if needed
	if err != nil {
		log.Fatalf("Failed to listen %v", err)
	}

	// create new gRPC server
	s := grpc.NewServer()
	// register the gRPC server to UserManagementServer
	pb.RegisterUserManagementServer(s, server)
	// log the server address
	log.Printf("Server listening at %v", lis.Addr())
	// return the server
	return s.Serve(lis)
}

func (server *UserManagementServer) CreateNewUser(ctx context.Context, in *pb.NewUser) (*pb.User, error) {
	// statement to create new users table
	createSql := `
	create table if not exists users(
		id SERIAL PRIMARY KEY,
		first_name text,
		last_name text,
		age int);
	`

	// exectue the table creation statment
	_, err := server.conn.Exec(context.Background(), createSql)
	// log errors if needed
	if err != nil {
		log.Printf("Table already exists: %v", err)
	}

	// log received request's name and age
	log.Printf("Received name: %v %v age: %v", in.GetFirstName(), in.GetLastName(), in.GetAge())

	// store the received user details and id together
	var created_user = &pb.User{FirstName: in.GetFirstName(), LastName: in.GetLastName(), Age: in.GetAge()}

	// start a transaction to the database
	tx, err := server.conn.Begin(context.Background())
	// log errors if needed
	if err != nil {
		log.Fatalf("conn.Begin() failed: %v", err)
	}

	_, err = tx.Exec(context.Background(), "insert into users(first_name, last_name, age) values ($1, $2, $3)", in.GetFirstName(), in.GetLastName(), in.GetAge())
	// log errors if needed
	if err != nil {
		log.Fatalf("tx.Exec() failed: %v", err)
	}

	// commit a transaction to the database
	tx.Commit(context.Background())

	// return created user (or nil if none exists)
	return created_user, nil
}

// function GetUsers() returns a list of received users
func (server *UserManagementServer) GetUsers(ctx context.Context, in *pb.GetUsersParams) (*pb.UsersList, error) {
	// log received request
	log.Print("Received Request: Get Users List")

	// create an empty UsersList
	var users_list *pb.UsersList = &pb.UsersList{}

	// query the database to get all rows from the users table
	rows, err := server.conn.Query(context.Background(), "select * from users")
	// log and return errors if needed
	if err != nil {
		log.Fatalf("conn.Query() failed: %v", err)
		return nil, err
	}

	// defer the closure of query
	defer rows.Close()

	// process each row in the query result
	for rows.Next() {
		// create new User
		user := pb.User{}
		// assign query result to User
		err = rows.Scan(&user.Id, &user.FirstName, &user.LastName, &user.Age)
		// log and return errors if needed
		if err != nil {
			log.Fatalf("rows.Scan() failed: %v", err)
			return nil, err
		}
		// append User to the UserList
		users_list.Users = append(users_list.Users, &user)
	}

	// return the existing list of created users (or nil if none exists)
	return users_list, nil
}

// function main()
func main() {
	// load the .env file
	err := godotenv.Load(".env")
	// log errors if needed
	if err != nil {
		log.Fatalf("Error loading .env file: %v", err)
	}

	// assign the credential from .env to databse_url
	databse_url := os.Getenv("databse_url")

	// establish connection to database
	conn, err := pgx.Connect(context.Background(), databse_url)
	// log errors if needed
	if err != nil {
		log.Fatalf("Unable to establish connection: %v", err)
	}

	// defer the closure of database connection
	defer conn.Close(context.Background())

	// create and initialize a new UserManagementServer object
	var user_management_server *UserManagementServer = NewUserManagementServer()
	user_management_server.conn = conn

	// run the server and log errors if needed
	if err := user_management_server.Run(); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
