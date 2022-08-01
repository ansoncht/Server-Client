// GetUsersBloc handles all the logic when received
// a GetUsersEvent and produce a GetUsersState

// imports
import 'package:bloc/bloc.dart';
import 'package:flutter_client/grpc/grpc_service.dart';
import 'package:flutter_client/protos/usermanagement.pb.dart';
import 'package:logging/logging.dart';

import 'package:flutter_client/bloc/get_users/get_users_event.dart';
import 'package:flutter_client/bloc/get_users/get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  // logger for the bloc
  final Logger logger;

  GetUsersBloc(this.logger) : super(GetUsersState.init()) {
    on<GetUsersEventClickGetUsers>(_getUsers);
  }

  // _getUsers get a list of users and emit a new state to the UI
  Future<void> _getUsers(
      GetUsersEventClickGetUsers event, Emitter<GetUsersState> emit) async {
    // log the action
    logger.fine('Entering _getUsers');

    try {
      // make request to the backend server and wait for a response
      final UsersList response = await GRPCService.getUsers();
      // assign information received to a list
      final List<User> users = response.users;
      // emit a new state with the list
      emit(state.gotUsers(users));
    } on Error catch (e) {
      // log the error
      logger.severe(e.toString());
      // rethrow exception
      rethrow;
    }
  }
}
