// HomeScreen is the Home Page of the app

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/user_management_app_bloc.dart';
import 'package:flutter_client/bloc/user_management_app_event.dart';

class HomeScreen extends StatelessWidget {
  // constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Management Application'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {
                        BlocProvider.of<UserManagementAppBloc>(context)
                            .add(UserManagementAppEventClickAddUser())
                      },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(30)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    'Add User',
                    style: TextStyle(fontSize: 30),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        BlocProvider.of<UserManagementAppBloc>(context)
                            .add(UserManagementAppEventClickAddUser())
                      },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(30)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    'Users List',
                    style: TextStyle(fontSize: 30),
                  )),
            ],
          ),
        ),
      );
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
