import 'package:dart_client/grpc/grpc_client.dart';
import 'package:dart_client/protos/usermanagement.pbgrpc.dart';
import 'package:dart_client/utils/logger.dart';
import 'package:logging/logging.dart';

// port number
final int customPort = 5001;

// log level
const logLevel = Level.ALL;

Future<void> main(List<String> arguments) async {
  // create logger
  final Logger logger = createLogger('gRPC_Logger', logLevel);

  // create grpc client
  final channel = createChannel();

  // try to set up the client and make rpc calls
  try {
    // create client
    final client = UserManagementClient(channel);

    // create users
    User response = await client.createNewUser(
      NewUser()
        ..name = 'Janet'
        ..age = 23,
    );
    logger.fine('Created User: ${response.name}');

    response = await client.createNewUser(
      NewUser()
        ..name = 'Anson'
        ..age = 23,
    );
    logger.fine('Created User: ${response.name}');
  } on Error catch (e) {
    logger.severe(e.toString());
    rethrow;
  }
  await channel.shutdown();
}
