// HomeScreen is the home page of the app

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/get_users/get_users_bloc.dart';
import 'package:flutter_client/bloc/get_users/get_users_event.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: const Text(
                      'Add User',
                      style: TextStyle(fontSize: 30),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                    onPressed: () => {
                          BlocProvider.of<UserManagementNavBloc>(context)
                              .add(UserManagementNavEventClickUsersList()),
                          BlocProvider.of<GetUsersBloc>(context)
                              .add(GetUsersEventClickGetUsers())
                        },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: const Text(
                      'Users List',
                      style: TextStyle(fontSize: 30),
                    )),
              )
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
