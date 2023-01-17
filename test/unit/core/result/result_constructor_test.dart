import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core_failure.dart';
import 'package:hmi_core/hmi_core_result.dart';

void main() {
  group('Result constructor', () {
    test('asserts if no args', () {
      expect(() => Result(), throwsA(isA<AssertionError>()));
    });
    test('completes if data is provided', () {
      expect(() => Result(data: 'test'), returnsNormally);
    });
    test('completes if error is provided', () {
      expect(
        () => Result(
          error: Failure(message: '', stackTrace: StackTrace.current),
        ), 
        returnsNormally,
      );
    });
  });
}