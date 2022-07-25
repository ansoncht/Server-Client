import 'package:flutter/material.dart';

// class UserManagementAppEvent (abstract)
@immutable
abstract class UserManagementAppEvent {}

// UserManagementAppEventClickHome means the app's home page should be loaded
class UserManagementAppEventClickHome implements UserManagementAppEvent {}

// UserManagementAppEventClickUsers means list of users page should be loaded
class UserManagementAppEventClickUsers implements UserManagementAppEvent {}

// UserManagementAppEventClickAddUser means the add user page should be loaded
class UserManagementAppEventClickAddUser implements UserManagementAppEvent {}
