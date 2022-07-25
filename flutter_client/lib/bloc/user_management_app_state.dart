import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum UserManagementAppStates {
  // app is started and loading
  loading,

  // home page loaded
  home,

  // users list page loaded
  usersList,

  // add user page loaded
  addUser,

  // error page loaded
  error,
}

// UserManagementAppState holds the app's state (in the navigator perspective)
@immutable
class UserManagementAppState extends Equatable {
  // state of the app's naviagator
  final UserManagementAppStates state;

  // error message
  final String error;

  const UserManagementAppState({required this.error, required this.state});

  factory UserManagementAppState.init() => const UserManagementAppState(
      error: '', state: UserManagementAppStates.loading);

  UserManagementAppState homeLoaded() => const UserManagementAppState(
      error: '', state: UserManagementAppStates.home);

  UserManagementAppState usersListLoaded() => const UserManagementAppState(
      error: '', state: UserManagementAppStates.usersList);

  UserManagementAppState addUserLoaded() => const UserManagementAppState(
      error: '', state: UserManagementAppStates.addUser);

  UserManagementAppState loadFailed(String e) =>
      UserManagementAppState(error: e, state: UserManagementAppStates.error);

  @override
  List<Object?> get props => [error, state];
}
