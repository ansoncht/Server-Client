// AddUserBloc handles all the logic when received
// a AddUserEvent and produce a AddUserState

// imports
import 'package:bloc/bloc.dart';
import 'package:flutter_client/grpc/grpc_service.dart';
import 'package:flutter_client/protos/usermanagement.pb.dart';
import 'package:logging/logging.dart';

import 'package:flutter_client/bloc/add_user/add_user_event.dart';
import 'package:flutter_client/bloc/add_user/add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  // logger for the bloc
  final Logger logger;

  AddUserBloc(this.logger) : super(AddUserState.init()) {
    on<AddUserEventClickAddUser>(_addUser);
  }

  // _addUser add a user and emit a new state to the UI
  Future<void> _addUser(
      AddUserEventClickAddUser event, Emitter<AddUserState> emit) async {
    // log the action
    logger.fine('Entering _addUser');

    try {
      // make request to the backend server and wait for a response
      final User response =
          await GRPCService.addUser(event.firstName, event.lastName, event.age);
      // emit a new state with the information received from the server
      emit(state.addedUser(response.firstName, response.lastName,
          response.age.toString(), response.id.toString()));
    } on Error catch (e) {
      // log the error
      logger.severe(e.toString());
      // rethrow exception
      rethrow;
    }
  }
}
