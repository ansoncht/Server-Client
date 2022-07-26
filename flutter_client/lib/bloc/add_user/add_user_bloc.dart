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

  Future<User> _addUser(
      AddUserEventClickAddUser event, Emitter<AddUserState> emit) async {
    logger.fine('Entering _addUser');
    try {
      final User response =
          await GRPCService.addUser(event.firstName, event.lastName, event.age);
      emit(state.addedUser(response.firstName, response.lastName,
          response.age.toString(), response.id.toString()));
      return response;
    } on Error catch (e) {
      logger.severe(e.toString());
    }
    return User();
  }
}
