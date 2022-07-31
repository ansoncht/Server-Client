// GetUsersEvent holds all the event GetUsersBloc can handle

// imports
import 'package:flutter/material.dart';

// class GetUsersEvent (abstract)
@immutable
abstract class GetUsersEvent {}

// AddUserEventClickAddUser means the the user clicked add user button
class GetUsersEventClickGetUsers implements GetUsersEvent {}
