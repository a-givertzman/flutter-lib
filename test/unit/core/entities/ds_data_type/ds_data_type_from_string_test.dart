import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsDataType fromString', () {
    expect(
      () => DsDataType.fromString('invalidType'),
      throwsA(isA<Failure>()),
    );
    for (final dataType in DsDataType.values) {
      expect(DsDataType.fromString(dataType.value), dataType);
      expect(DsDataType.fromString(dataType.value.toUpperCase()), dataType);
    }
  });
}