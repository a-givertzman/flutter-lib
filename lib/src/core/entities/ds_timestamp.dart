import 'package:hmi_core/src/core/error/failure.dart';

///
/// Хранит метку времени 
/// и преобразовывает в строку для передачи в JSON,
/// преобразовывает из JSON в DateTime
class DsTimeStamp {
  final DateTime _dateTime;
  ///
  const DsTimeStamp({
    required DateTime dateTime,
  }) :
    _dateTime = dateTime;
  ///
  /// Преобразует строку в формате yyyy-MM-ddTHH:mm:ss.mmmuuuZ для UTC time, 
  /// и yyyy-MM-ddTHH:mm:ss.mmmuuu (no trailing "Z") для local/non-UTC time 
  /// в DateTime, где:
  /// - yyyy is a, possibly negative, four digit representation of the year, if the year is in the range -9999 to 9999, otherwise it is a signed six digit representation of the year.
  /// - MM is the month in the range 01 to 12,
  /// - dd is the day of the month in the range 01 to 31,
  /// - HH are hours in the range 00 to 23,
  /// - mm are minutes in the range 00 to 59,
  /// - ss are seconds in the range 00 to 59 (no leap seconds),
  /// - mmm are milliseconds in the range 000 to 999, and
  /// - uuu are microseconds in the range 001 to 999. If [microsecond] equals 0, then this part is omitted.
  factory DsTimeStamp.parse(String value) {
    final dateTime = DateTime.tryParse(value);
    if (dateTime != null) {
      return DsTimeStamp(dateTime: dateTime);
    } else {
      throw Failure.convertion(
        message: 'Ошибка в методе $DsTimeStamp.parse: Недопустимый формат метки времени в:\n\t$value',
        stackTrace: StackTrace.current,
      );
    }
  }
  ///
  /// Создает метку времени с текущим смистемным временем
  factory DsTimeStamp.now() => DsTimeStamp(dateTime: DateTime.now());
  /// 
  /// Возвращает метку времени в формаате DateTime
  DateTime get value => _dateTime;
  /// Возвращает метку времени в формаате yyyy-MM-ddTHH:mm:ss.mmmuuuZ
  @override
  String toString() {
    return _dateTime.toIso8601String();
  }
  @override
  bool operator ==(Object other) =>
    other is DsTimeStamp &&
    other.runtimeType == runtimeType &&
    other.value.isAtSameMomentAs(_dateTime);
}