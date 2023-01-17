import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core_failure.dart';
import 'package:hmi_core/hmi_core_result.dart';

void main() {    
  group('Result data', () {
    final resultWithData = Result(data: 'test');
    final resultWithError = Result(
      error: Failure(message: '', stackTrace: StackTrace.current),
    );
    test('throws if no data', () {
      expect(() => resultWithError.data, throwsA(isA<Exception>()));
    });
    test('returns if data is provided', () {
      expect(() => resultWithData.data, returnsNormally);
    });
  });
}