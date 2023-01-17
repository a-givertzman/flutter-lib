import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsStatus fromValue', () {
    expect(() => DsStatus.fromValue(-1), throwsA(isA<Failure>()));
    for(final status in DsStatus.values) {
      expect(DsStatus.fromValue(status.value), status);
    }
  });
}