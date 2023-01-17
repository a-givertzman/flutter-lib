import 'dart:convert';
import 'package:hmi_core/src/core/entities/ds_data_type.dart';
import 'package:hmi_core/src/core/entities/ds_status.dart';

abstract class IDataPoint<T> {

}


class DsDataPoint<T> implements IDataPoint {
  final DsDataType type;
  final String path;
  final String name;
  final T value;
  final DsStatus status;
  final int history;
  final int alarm;
  final String timestamp;
  ///
  /// Represent a data received from SocketDataServer
  /// wich contains map in json like:
  ///   type: S7DataType
  ///   name: 'part.subpart1.sabpart...'
  ///   value: current value of type depending on S7DataType
  DsDataPoint({
    required this.type,
    required this.path,
    required this.name,
    required this.value,
    this.history = 0,
    this.alarm = 0,
    required this.status,
    required this.timestamp,
  });
  ///
  String toJson() {
    return json.encode({
      'type': type.value,
      'path': path,
      'name': name,
      'value': value,
      'status': status.value,
      'history': history,
      'alarm': alarm,
      'timestamp': timestamp,
    });
  }
  ///
  @override
  String toString() {
    return 'DataPoint {type: $type, name: $name, value: $value, status: $status, history: $history, alarm: $alarm}';
  }
  @override
  bool operator ==(Object other) =>
    other is DsDataPoint
    && type == other.type
    && path == other.path
    && name == other.name
    && value == other.value
    && status == other.status
    && history == other.history
    && alarm == other.alarm
    && timestamp == other.timestamp;
}