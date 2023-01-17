import 'dart:convert';

import 'package:hmi_core/hmi_core.dart';

DsCommand getCommandWith({
  DsDataClass dsClass = DsDataClass.commonCmd,
  DsDataType type = DsDataType.bool,
  String path = 'path',
  String name = 'name',
  dynamic value=0,
  DsStatus status = DsStatus.ok,
  required DsTimeStamp timestamp,
}) {
  return DsCommand(
        dsClass: dsClass, 
        type: type,
        path: path,
        name: name,
        value: value,
        status: status,
        timestamp: timestamp,
  );
}

String getStringifiedCommandWithValue(dynamic value, DsTimeStamp timestamp) {
  return json.encode({
    'class': 'commonCmd',
    'type': 'bool',
    'path': 'path',
    'name': 'name',
    'value': value,
    'status': 0,
    'timestamp': timestamp.toString(),
  });
}

// void testIfThrows(Map<String,dynamic> map) {
//   expect(
//     () => DsCommand.fromJson(json.encode(map)), 
//     throwsA(isA<Failure>()),
//   );
// }