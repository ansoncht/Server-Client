// package name
package main

// imports
import (
	"context"
	"log"
	"math"
	"math/rand"
	"net"

	pb "github.com/ansoncht/server-client/protos"

	"google.golang.org/grpc"
)

// constants
const (
	port = ":5001"
)

// UserManagementServer struct
type UserManagementServer struct {
	pb.UnimplementedUserManagementServer
	user_list *pb.UsersList
}

// function NewUserManagementServer() creates a new UserManagementServer with an empty list for created users
func NewUserManagementServer() *UserManagementServer {
	// return a new UserManagementServer with user_list initialized
	return &UserManagementServer{
		user_list: &pb.UsersList{},
	}
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

func (s *UserManagementServer) CreateNewUser(ctx context.Context, in *pb.NewUser) (*pb.User, error) {
	// log received request's name and age
	log.Printf("Received name: %v %v age: %v", in.GetFirstName(), in.GetLastName(), in.GetAge())

	// generate a random ID
	var user_id int32 = int32(rand.Intn(math.MaxInt32))

	// store the received user details and id together
	var created_user = &pb.User{FirstName: in.GetFirstName(), LastName: in.GetLastName(), Age: in.GetAge(), Id: user_id}

	// append the create user to the existing list of created users
	s.user_list.Users = append(s.user_list.Users, created_user)

	// return created user (or nil if none exists)
	return created_user, nil
}

// function GetUsers() returns a list of received users
func (s *UserManagementServer) GetUsers(ctx context.Context, in *pb.GetUsersParams) (*pb.UsersList, error) {
	// return the existing list of created users (or nil if none exists)
	return s.user_list, nil
}

// function main()
func main() {
	// create and initialize a new UserManagementServer object
	var user_management_server *UserManagementServer = NewUserManagementServer()
	// run the server and log errors if needed
	if err := user_management_server.Run(); err != nil {
		log.Fatalf("Failed to serve: %b", err)
	}
}
