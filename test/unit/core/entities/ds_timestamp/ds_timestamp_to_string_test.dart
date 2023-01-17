import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsTimeStamp toString', () {
    final datetime = DateTime.now();
    final dsTimeStamp = DsTimeStamp(dateTime: datetime);
    expect(dsTimeStamp.toString(), datetime.toIso8601String());
  });
}