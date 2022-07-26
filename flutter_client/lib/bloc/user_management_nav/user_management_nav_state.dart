// UserManagementAppState holds the user_management_nav's bloc state

// imports
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum UserManagementNavStates {
  // app is started
  start,

  // home page loaded
  home,

  // users list page loaded
  usersList,

  // add user page loaded
  addUser,

  // error page loaded
  error,
}

@immutable
class UserManagementNavState extends Equatable {
  // state of the app's naviagator
  final UserManagementNavStates state;

  // error message
  final String error;

  // constructor
  const UserManagementNavState({required this.error, required this.state});

  // initial state
  factory UserManagementNavState.init() => const UserManagementNavState(
      error: '', state: UserManagementNavStates.start);

  // home page loaded state
  UserManagementNavState homeLoaded() => const UserManagementNavState(
      error: '', state: UserManagementNavStates.home);

  // users list page loaded state
  UserManagementNavState usersListLoaded() => const UserManagementNavState(
      error: '', state: UserManagementNavStates.usersList);

  // add user page loaded state
  UserManagementNavState addUserLoaded() => const UserManagementNavState(
      error: '', state: UserManagementNavStates.addUser);

  // load failed state
  UserManagementNavState loadFailed(String e) =>
      UserManagementNavState(error: e, state: UserManagementNavStates.error);

  @override
  List<Object?> get props => [error, state];
}
