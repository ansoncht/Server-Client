// GetUsersBloc handles all the logic when received
// a GetUsersEvent and produce a GetUsersState

// imports
import 'package:bloc/bloc.dart';
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

  Future<void> _getUsers(
      GetUsersEventClickGetUsers event, Emitter<GetUsersState> emit) async {
    logger.fine('Entering _getUsers');

    try {
      emit(state.gotUsers([]));
    } on Error catch (e) {
      logger.severe(e.toString());
    }
  }
}
