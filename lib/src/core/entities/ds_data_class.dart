import 'package:hmi_core/src/core/error/failure.dart';

///
/// Классифицирует сигнал/команду передаваемую между DataServer и клиентами:
/// - [requestAll] - команда запрашивает все тэги, 
/// - [requestList] - команда запрашивает списком имен тэгов, 
///   ожидая что DataSetver отправит их последние значения в поток;
/// - [requestTime] - команда запрашивает текущее время с DataServer;
/// - [requestAlarms] - команда запрашивает активные аварии;
/// - [requestPath] - команда запрашивает все тэги по указанному пути;
/// - [syncTime] - команда синхронизации времени;
/// - [commonCmd] - команда со значением типа Bool, Int, Real, etc...;
/// - [intCmd] - команда со значением типа Int;
/// - [realCmd] - команда со значением типа Real;
/// - [commonData] - тэги со значением типа Bool, Int, Real, etc...;
enum DsDataClass {
  requestAll('requestAll'),
  requestList('requestList'),
  requestTime('requestTime'),
  requestAlarms('requestAlarms'),
  requestPath('requestPath'),
  syncTime('syncTime'),
  commonCmd('commonCmd'),
  commonData('commonData');
  ///
  const DsDataClass(this.value);
  final String value;
  static final _valueMapping = <String, DsDataClass>{
    for (var dataClass in DsDataClass.values) 
      dataClass.value : dataClass,
  };
  ///
  factory DsDataClass.fromString(String value) {
    final dataClass = _valueMapping[value];
    if (dataClass == null) {
      throw Failure.connection(
        message: 'Ошибка в методе $DsDataClass.fromString: неизвестный класс комманды "$value"',
        stackTrace: StackTrace.current,
      );
    }
    return dataClass;
  }
}
