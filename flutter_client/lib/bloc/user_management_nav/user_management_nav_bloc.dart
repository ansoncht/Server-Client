// UserManagementAppBloc handles all the logic when received
// a UserManagementAppEvent and produce a UserManagementAppState

// imports
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

import 'package:flutter_client/bloc/user_management_nav/user_management_nav_event.dart';
import 'package:flutter_client/bloc/user_management_nav/user_management_nav_state.dart';

class UserManagementNavBloc
    extends Bloc<UserManagementNavEvent, UserManagementNavState> {
  // logger for the bloc
  final Logger logger;

  // constructor
  UserManagementNavBloc(this.logger) : super(UserManagementNavState.init()) {
    on<UserManagementNavEventClickHome>(_navEnteredHome);
    on<UserManagementNavEventClickAddUser>(_navEnteredAddUser);
    on<UserManagementNavEventClickUsers>(_navEnteredUsersList);
  }

  Future<void> _navEnteredHome(UserManagementNavEvent event,
      Emitter<UserManagementNavState> emit) async {
    try {
      // fake the app startup fetching process
      await Future.delayed(const Duration(seconds: 1), () {});

      // log the action
      logger.fine('Entering _navEnteredHome');

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

  Future<void> _navEnteredAddUser(UserManagementNavEvent event,
      Emitter<UserManagementNavState> emit) async {
    try {
      // log the action
      logger.fine('Entering _navEnteredAddUser');

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

  Future<void> _navEnteredUsersList(UserManagementNavEvent event,
      Emitter<UserManagementNavState> emit) async {
    try {
      // log the action
      logger.fine('Entering _navEnteredUsersList');

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
}
