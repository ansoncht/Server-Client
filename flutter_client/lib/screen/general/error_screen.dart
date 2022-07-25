// ErrorScreen is a page for showing errors

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_client/bloc/user_management_app_bloc.dart';
import 'package:flutter_client/bloc/user_management_app_state.dart';

class ErrorScreen extends StatelessWidget {
  // constructor
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Center(
        child: BlocBuilder<UserManagementAppBloc, UserManagementAppState>(
          builder: (context, state) {
            return Text(
              state.error,
            );
          },
        ),
      );
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
