// ErrorScreen is a page for showing errors

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_state.dart';

class ErrorScreen extends StatelessWidget {
  // constructor
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Center(
        child: BlocBuilder<UserManagementNavBloc, UserManagementNavState>(
          builder: (context, state) {
            return Column(children: [
              const Icon(
                Icons.bug_report,
                size: 200,
              ),
              Text(
                state.error,
              )
            ]);
          },
        ),
      );
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
