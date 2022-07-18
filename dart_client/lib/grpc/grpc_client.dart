import 'package:dart_client/protos/usermanagement.pbgrpc.dart';
import 'package:grpc/grpc.dart';

// port number
final int customPort = 5001;

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

  return channel;
}
