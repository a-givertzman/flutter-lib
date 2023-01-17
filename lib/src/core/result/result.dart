
import 'package:hmi_core/src/core/error/failure.dart';

/// 
/// Result contains or data of type T or error
class Result<T> {
  final T? _data;
  final Failure? _error;
  const Result({
    T? data,
    Failure? error,
  }) : 
    assert(data != null || error != null),
    _data = data,
    _error = error;
  ///
  T get data {
    final d = _data;
    if (d != null) {
      return d;
    } else {
      throw Exception('[$runtimeType.data] data is null, please check before access ore use fold methed');
    }
  }
  ///
  Failure get error {
    final e = _error;
    if (e != null) {
      return e;
    } else {
      throw Exception('[$runtimeType.error] error is null, please check before access ore use fold methed');
    }
  }
  ///
  bool get hasData => _data != null;
  ///
  bool get hasError => _error != null;
  ///
  S fold<S>(
    S Function(T data) onData,
    S Function(Failure error) onError, 
  ) {
    final data = _data;
    if (data != null) {
      return onData(data);
    } else {
      final error = _error;
      if (error != null) {
        return onError(error);
      } else {
        throw Exception('error can not be null if data is null');
      }
    }
  }
  ///
  @override
  String toString() {
    return 'Result{\n\thasData: $hasData; hasError: $hasError\n\tdata:$_data\n\terror:$_error}';
  }
}