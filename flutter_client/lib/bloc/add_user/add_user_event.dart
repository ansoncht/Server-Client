// AddUserEvent holds all the event AddUserBloc can handle

// imports
import 'package:flutter/material.dart';

// class AddUserEvent (abstract)
@immutable
abstract class AddUserEvent {}

// AddUserEventClickAddUser means the the user clicked add user button
class AddUserEventClickAddUser implements AddUserEvent {
  // first name
  final String firstName;
  // last name
  final String lastName;
  // age
  final int age;

  AddUserEventClickAddUser(
      {required this.firstName, required this.lastName, required this.age});
}
