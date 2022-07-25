import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

import 'package:flutter_client/bloc/user_management_app_event.dart';
import 'package:flutter_client/bloc/user_management_app_state.dart';

class UserManagementAppBloc
    extends Bloc<UserManagementAppEvent, UserManagementAppState> {
  // logger for the bloc
  final Logger logger;

  // constructor
  UserManagementAppBloc(this.logger) : super(UserManagementAppState.init()) {
    on<UserManagementAppEventClickHome>(_appEnteredHome);
    on<UserManagementAppEventClickUsers>(_appEnteredUsersList);
    on<UserManagementAppEventClickAddUser>(_appEnteredAddUser);
  }

  Future<void> _appEnteredHome(
      event, Emitter<UserManagementAppState> emit) async {
    try {
      // fake the app startup fetching process
      await Future.delayed(const Duration(seconds: 1), () {});

      // log the action
      logger.fine("Entering _appEnterHome");

      // emit the home loaded state
      emit(state.homeLoaded());
    } on Error catch (e) {
      // log the error
      logger.severe(e.toString());
      // emit the error state
      emit(state.loadFailed(e.toString()));
      // rethrow exception
      rethrow;
    }
  }

  Future<void> _appEnteredUsersList(
      event, Emitter<UserManagementAppState> emit) async {
    try {
      // log the action
      logger.fine("Entering _appEnteredUsersList");

      // emit the home loaded state
      emit(state.usersListLoaded());
    } on Error catch (e) {
      // log the error
      logger.severe(e.toString());
      // emit the error state
      emit(state.loadFailed(e.toString()));
      // rethrow exception
      rethrow;
    }
  }

  Future<void> _appEnteredAddUser(
      event, Emitter<UserManagementAppState> emit) async {
    try {
      // log the action
      logger.fine("Entering _appEnteredAddUser");

      // emit the home loaded state
      emit(state.addUserLoaded());
    } on Error catch (e) {
      // log the error
      logger.severe(e.toString());
      // emit the error state
      emit(state.loadFailed(e.toString()));
      // rethrow exception
      rethrow;
    }
  }
}
