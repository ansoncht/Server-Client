// UserManagementAppEvent holds all the event UserManagementAppBloc can handle

// imports
import 'package:flutter/material.dart';

// class UserManagementAppEvent (abstract)
@immutable
abstract class UserManagementNavEvent {}

// UserManagementAppEventClickHome means the app's home page should be loaded
class UserManagementNavEventClickHome implements UserManagementNavEvent {}

// UserManagementAppEventClickUsers means list of users page should be loaded
class UserManagementNavEventClickUsers implements UserManagementNavEvent {}

// UserManagementAppEventClickAddUser means the add user page should be loaded
class UserManagementNavEventClickAddUser implements UserManagementNavEvent {}
