// AddUserScreen is the page to add new user

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/add_user/add_user_bloc.dart';
import 'package:flutter_client/bloc/add_user/add_user_event.dart';
import 'package:flutter_client/bloc/add_user/add_user_state.dart';

import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_event.dart';

class AddUserScreen extends StatelessWidget {
  // constructor
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final ageController = TextEditingController();
    try {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Add New User'),
            centerTitle: true,
            leading: BackButton(
              onPressed: () => {
                Navigator.of(context).popUntil((route) => route.isFirst),
                BlocProvider.of<UserManagementNavBloc>(context)
                    .add(UserManagementNavEventClickHome()),
              },
            ),
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.blue, width: 5)),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          border: UnderlineInputBorder(),
                          labelText: "Enter Your First Name"),
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          border: UnderlineInputBorder(),
                          labelText: "Enter Your Last Name"),
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          border: UnderlineInputBorder(),
                          labelText: "Enter Your Age"),
                    ),
                    ElevatedButton(
                        onPressed: () => {
                              // initiate a AddUserEventClickAddUser event to
                              // make grpc call to the backend server
                              BlocProvider.of<AddUserBloc>(context).add(
                                  AddUserEventClickAddUser(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      age: int.parse(ageController.text))),
                              // create pop up to show the created user details
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return BlocBuilder<AddUserBloc, AddUserState>(
                                    builder: (context, state) {
                                      return AlertDialog(
                                        insetPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 50.0,
                                          vertical: 200.0,
                                        ),
                                        title: const Center(
                                            child: Text('User Created')),
                                        content: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Expanded(
                                                child: Divider(
                                              thickness: 5,
                                              color: Colors.white,
                                            )),
                                            Expanded(
                                                child: Text(
                                                    'First Name: ${state.firstName}')),
                                            Expanded(
                                                child: Text(
                                                    'Last Name: ${state.lastName}')),
                                            Expanded(
                                                child:
                                                    Text('Age: ${state.age}')),
                                            Expanded(
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                                    onPressed: () => {
                                                          // close the pop up
                                                          Navigator.pop(context)
                                                        },
                                                    child: const Text(
                                                      'OK',
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ))),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              // initiate a UserManagementNavEventClickHome
                              // event to go back to home page
                              BlocProvider.of<UserManagementNavBloc>(context)
                                  .add(UserManagementNavEventClickHome()),
                              // pop the current page out of the navigator
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst),
                            },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Text(
                          'Add User',
                          style: TextStyle(fontSize: 25),
                        )),
                  ]),
            ),
          ));
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
