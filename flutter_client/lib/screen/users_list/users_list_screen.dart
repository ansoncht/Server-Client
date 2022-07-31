import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_event.dart';

class UsersListScreen extends StatelessWidget {
  // constructors
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Users List'),
            centerTitle: true,
            leading: BackButton(
              onPressed: () => {
                Navigator.of(context).popUntil((route) => route.isFirst),
                BlocProvider.of<UserManagementNavBloc>(context)
                    .add(UserManagementNavEventClickHome()),
              },
            ),
          ),
          body: const Center(
            child: Text('Users'),
          ));
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
