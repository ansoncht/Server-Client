# Go server - Dart client
This is a mock Golang server and Flutter client using gRPC

Server (Written in Golang): handles all the request through gRPC and give appropriate response

Client (Written in Flutter / Dart): gives a nicely designed UI for users to input data and interact with

Work Flow:
1. User launch the flutter client app
2. User input information on the flutter clientapp
3. Flutter client app will make gRPC calls to the Golang backend server
4. Golang backend server will give response back to the flutter client app

Technologies Used:
- Flutter / Dart : For implementing frontend client app (Compiled down to C, no bridge to communicate with the native code is needed. One set of codes can be run on iOS, Android, and Web.) 
- Golang: For implementing backend server (Faster execution, concurrency ready for future developements.)
- gRPC: For enforcing the rules when making Requests and Responses (Faster execution than REST.)
- bloc (Business Logic Component): For state management in the frontend flutter mobile / web app (Easy to maintain and scalable. Improve codes' quality and seperate logics from user end)
