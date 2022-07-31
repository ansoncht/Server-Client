///
//  Generated code. Do not modify.
//  source: protos/usermanagement.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use newUserDescriptor instead')
const NewUser$json = const {
  '1': 'NewUser',
  '2': const [
    const {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'age', '3': 3, '4': 1, '5': 5, '10': 'age'},
  ],
};

/// Descriptor for `NewUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newUserDescriptor = $convert.base64Decode('CgdOZXdVc2VyEh0KCmZpcnN0X25hbWUYASABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYAiABKAlSCGxhc3ROYW1lEhAKA2FnZRgDIAEoBVIDYWdl');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'age', '3': 3, '4': 1, '5': 5, '10': 'age'},
    const {'1': 'id', '3': 4, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEh0KCmZpcnN0X25hbWUYASABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYAiABKAlSCGxhc3ROYW1lEhAKA2FnZRgDIAEoBVIDYWdlEg4KAmlkGAQgASgFUgJpZA==');
@$core.Deprecated('Use getUsersParamsDescriptor instead')
const GetUsersParams$json = const {
  '1': 'GetUsersParams',
};

/// Descriptor for `GetUsersParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersParamsDescriptor = $convert.base64Decode('Cg5HZXRVc2Vyc1BhcmFtcw==');
@$core.Deprecated('Use usersListDescriptor instead')
const UsersList$json = const {
  '1': 'UsersList',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.usermanagement.User', '10': 'users'},
  ],
};

/// Descriptor for `UsersList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersListDescriptor = $convert.base64Decode('CglVc2Vyc0xpc3QSKgoFdXNlcnMYASADKAsyFC51c2VybWFuYWdlbWVudC5Vc2VyUgV1c2Vycw==');
