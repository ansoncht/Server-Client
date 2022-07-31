// HomeScreen is the home page of the app

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_event.dart';
import 'package:flutter_client/screen/add_user/add_user_screen.dart';

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
                        BlocProvider.of<UserManagementNavBloc>(context)
                            .add(UserManagementNavEventClickAddUser()),
                        Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                            builder: ((context) => const AddUserScreen()),
                          ),
                        ),
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
                        BlocProvider.of<UserManagementNavBloc>(context)
                            .add(UserManagementNavEventClickUsers())
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
