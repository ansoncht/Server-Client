// UserManagementAppNavigator handles navigation of the app

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_client/bloc/user_management_app_bloc.dart';
import 'package:flutter_client/bloc/user_management_app_state.dart';
import 'package:flutter_client/screen/general/bug_screen.dart';
import 'package:flutter_client/screen/general/home_screen.dart';
import 'package:flutter_client/screen/general/loading_screen.dart';

class UserManagementAppNavigator extends StatelessWidget {
  // constructor
  const UserManagementAppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserManagementAppBloc, UserManagementAppState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            const MaterialPage(child: BugScreen()),

            // app loading
            if (state.state == UserManagementAppStates.loading)
              const MaterialPage(child: LoadingScreen()),

            // app loaded and on home page
            if (state.state == UserManagementAppStates.home)
              const MaterialPage(child: HomeScreen()),
          ],
          onPopPage: (route, result) {
            log('Popped Page');
            return route.didPop(result);
          },
        );
      },
    );
  }
}
