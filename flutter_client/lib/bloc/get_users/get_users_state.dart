// GetUsersState holds the GetUsersBloc's bloc state

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_client/protos/usermanagement.pb.dart';

@immutable
class GetUsersState extends Equatable {
  // users list
  final List<User> result;

  // constructor
  const GetUsersState({required this.result});

  // initial state
  factory GetUsersState.init() => const GetUsersState(result: []);

  // users list fetched state
  GetUsersState gotUsers(List<User> result) => GetUsersState(result: result);
  // redefine props for comparison and testing purposes
  @override
  List<Object?> get props => [result];
}
