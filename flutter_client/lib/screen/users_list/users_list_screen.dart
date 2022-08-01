import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/get_users/get_users_bloc.dart';
import 'package:flutter_client/bloc/get_users/get_users_state.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_event.dart';
import 'package:flutter_client/screen/users_list/user_details_screen.dart';

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
          body: BlocBuilder<GetUsersBloc, GetUsersState>(
            builder: (context, state) {
              return ListView.separated(
                itemCount: state.result.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 2.0),
                  title: Text(
                      '${state.result[index].firstName} ${state.result[index].lastName}'),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserDetailsScreen(index: index)),
                    )
                  },
                  hoverColor: Colors.grey.shade900,
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade600,
                  thickness: 0.5,
                ),
              );
            },
          ));
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
