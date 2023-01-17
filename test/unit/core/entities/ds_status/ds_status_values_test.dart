import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsStatus values', () {
    expect(DsStatus.ok.value, 0);
    expect(DsStatus.obsolete.value, 2);
    expect(DsStatus.timeInvalid.value, 3);
    expect(DsStatus.invalid.value, 10);
  });
}