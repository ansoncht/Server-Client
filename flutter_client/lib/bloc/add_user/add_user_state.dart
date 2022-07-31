// AddUserState holds the AddUserBloc's bloc state

// imports
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AddUserState extends Equatable {
  // first name
  final String firstName;
  // last name
  final String lastName;
  // age
  final String age;
  // id
  final String id;

  // constructor
  const AddUserState(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.id});

  // initial state
  factory AddUserState.init() =>
      const AddUserState(firstName: '', lastName: '', age: '', id: '');

  // user added state
  AddUserState addedUser(
          String firstName, String lastName, String age, String id) =>
      AddUserState(firstName: firstName, lastName: lastName, age: age, id: id);

  // redefine props for comparison and testing purposes
  @override
  List<Object?> get props => [firstName, lastName];
}
