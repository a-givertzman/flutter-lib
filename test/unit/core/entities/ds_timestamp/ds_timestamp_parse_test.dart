import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsTimeStamp parse', () {
    final datetime = DateTime.now();
    expect(() => DsTimeStamp.parse('0test'), throwsA(isA<Failure>()));
    expect(DsTimeStamp.parse(datetime.toString()).value, datetime);
  });
}