import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/user_management_app_bloc.dart';
import 'package:flutter_client/bloc/user_management_app_event.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            UserManagementAppBloc(createLogger('UserManagementAppBloc'))
              ..add(UserManagementAppEventClickHome()),
        child: const UserManagementAppNavigator(),
      ),
    );
  }
}
