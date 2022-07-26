import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/add_user/add_user_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_bloc.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_event.dart';
import 'package:flutter_client/navigator/usermanagement_app_navigator.dart';
import 'package:flutter_client/util/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserManagementNavBloc>(
          create: (BuildContext context) =>
              UserManagementNavBloc(createLogger('UserManagementNavBloc'))
                ..add(UserManagementNavEventClickHome()),
        ),
        BlocProvider<AddUserBloc>(
          create: (BuildContext context) =>
              AddUserBloc(createLogger('AddUserBloc')),
        ),
      ],
      child: MaterialApp(
        title: 'User Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserManagementAppNavigator(),
      ),
    );
  }
}
