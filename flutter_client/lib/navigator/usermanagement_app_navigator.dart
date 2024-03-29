// UserManagementAppNavigator handles navigation of the app

// imports
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_state.dart';
import 'package:flutter_client/screen/add_user/add_user_screen.dart';
import 'package:flutter_client/screen/general/error_screen.dart';
import 'package:flutter_client/screen/general/home_screen.dart';
import 'package:flutter_client/screen/general/loading_screen.dart';
import 'package:flutter_client/screen/users_list/users_list_screen.dart';

class UserManagementAppNavigator extends StatelessWidget {
  // constructor
  const UserManagementAppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserManagementNavBloc, UserManagementNavState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            const MaterialPage(child: LoadingScreen()),

            // app loaded and on home page
            if (state.state == UserManagementNavStates.home)
              const MaterialPage(child: HomeScreen()),

            // load failed and on error page
            if (state.state == UserManagementNavStates.error)
              const MaterialPage(child: ErrorScreen()),

            // add user page loaded
            if (state.state == UserManagementNavStates.addUser)
              const MaterialPage(child: AddUserScreen()),

            // get users list page loaded
            if (state.state == UserManagementNavStates.usersList)
              const MaterialPage(child: UsersListScreen()),
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
