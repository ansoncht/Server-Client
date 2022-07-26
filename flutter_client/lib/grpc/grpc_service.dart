import 'package:flutter_client/protos/usermanagement.pbgrpc.dart';
import 'package:flutter_client/util/logger.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

// port number
const int customPort = 5001;

ClientChannel createChannel() {
  // create channel
  final channel = ClientChannel(
    'localhost',
    port: customPort,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  // return channel
  return channel;
}

class GRPCService {
  // create logger
  static final Logger logger = createLogger('gRPC_Logger');

  static Future<User> addUser(
      String firstName, String lastName, int age) async {
    // create channel
    final channel = createChannel();
    // create grpc client
    final client = UserManagementClient(channel);

    // create users
    try {
      NewUser request =
          NewUser(firstName: firstName, lastName: lastName, age: age);
      User response = await client.createNewUser(request);
      logger.fine('Created User: ${response.firstName + response.lastName}');
      return response;
    } on Error catch (e) {
      logger.severe(e.toString());
      rethrow;
    }
  }
}
