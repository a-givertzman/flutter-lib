import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsStatus fromString', () {
    expect(() => DsStatus.fromString('0test'), throwsA(isA<Failure>()));
    expect(() => DsStatus.fromString('-1'), throwsA(isA<Failure>()));
    for(final status in DsStatus.values) {
      expect(DsStatus.fromString(status.value.toString()), status);
    }
  });
}