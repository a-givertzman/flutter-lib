import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsTimeStamp operator ==', () {
    final datetime = DateTime.now();
    final timestamp = DsTimeStamp(dateTime: datetime);
    
    expect(timestamp == 'test', false);
    expect(timestamp == DsTimeStamp(dateTime: datetime), true);
    expect(timestamp == DsTimeStamp(dateTime: DateTime.now()), false);
  });
}