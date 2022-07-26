package main

import (
	"context"
	"log"
	"math"
	"math/rand"
	"net"

	pb "github.com/ansoncht/server-client/protos"

	"google.golang.org/grpc"
)

const (
	port = ":5001"
)

type UserManagementServer struct {
	pb.UnimplementedUserManagementServer
}

func (s *UserManagementServer) CreateNewUser(ctx context.Context, in *pb.NewUser) (*pb.User, error) {
	// log received request's name and age
	log.Printf("Received name: %v %v age: %v", in.GetFirstName(), in.GetLastName(), in.GetAge())
	var user_id int32 = int32(rand.Intn(math.MaxInt32))

	// return created user
	return &pb.User{FirstName: in.GetFirstName(), LastName: in.GetLastName(), Age: in.GetAge(), Id: user_id}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("Failed to listen %v", err)
	}

	s := grpc.NewServer()
	pb.RegisterUserManagementServer(s, &UserManagementServer{})
	log.Printf("Server listening at %v", lis.Addr())

	err = s.Serve(lis)
	if err != nil {
		log.Fatalf("Failed to serve %v", err)
	}

}
