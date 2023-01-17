import 'package:hmi_core/src/core/error/failure.dart';

enum DsDataType {
  bool('bool', 1),
  integer('int', 2),
  uInt('uint', 2),
  dInt('dint', 4),
  word('word', 2),
  lInt('lint', 8),
  real('real', 4),
  time('time', 4),
  dateAndTime('date_and_time', 8);
  ///
  const DsDataType(this.value, this.length);
  final String value;
  final int length;
  static final _valueMapping = <String, DsDataType>{
    for (var dataType in DsDataType.values) 
      dataType.value : dataType,
  };
  ///
  factory DsDataType.fromString(String value) {
    final lvalue = value.toLowerCase();
    final dataType = _valueMapping[lvalue];
    if (dataType == null) {
      throw Failure.connection(
        message: 'Ошибка в методе $DsDataType._extract: неизвестный тип данных $value',
        stackTrace: StackTrace.current,
      );
    }
    return dataType;
  }
  ///
  @override
  String toString() {
    return 'DsDataType {name: $name, length: $length}';
  }
}
