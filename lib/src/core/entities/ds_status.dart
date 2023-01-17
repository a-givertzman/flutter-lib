import 'package:hmi_core/src/core/error/failure.dart';

/// статусы точки данных
enum DsStatus {
  ok(0),
  obsolete(2),
  timeInvalid(3),
  invalid(10);
  ///
  const DsStatus(this.value);
  final int value;
  static final _valueMapping = <int, DsStatus>{
    for (var status in DsStatus.values) 
      status.value : status,
  };
  ///
  factory DsStatus.fromString(String rawValue) {
    final parsedValue = int.tryParse(rawValue);
    if (parsedValue != null) {
      return DsStatus.fromValue(parsedValue);
    } else {
      throw Failure.connection(
        message:
            'Ошибка в методе $DsStatus.fromString: int.parse.error значение: "$rawValue"',
        stackTrace: StackTrace.current,
      );
    }
  }
  ///
  factory DsStatus.fromValue(int code) {
    final status = _valueMapping[code];
      if (status == null) {
        throw Failure.connection(
          message:
              'Ошибка в методе $DsStatus.fromValue: неизвестный статус "$code"',
          stackTrace: StackTrace.current,
        );
      }
      return status;
  }
  ///
  @override
  String toString() {
    return 'DsStatus {name: $value}';
  }
}
