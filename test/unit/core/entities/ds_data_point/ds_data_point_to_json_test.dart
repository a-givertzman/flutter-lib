import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

void main() {
  test('DsDataPoint toJson', () {
    final point = DsDataPoint(
      type: DsDataType.bool,
      path: 'path1',
      name: 'name1',
      value: 0,
      status: DsStatus.invalid,
      timestamp: DsTimeStamp.now().toString(),
    );
    final serializedPoint = point.toJson();
    expect(serializedPoint.contains('"type":"bool"'), true);
    expect(serializedPoint.contains('"status":10'), true);
    expect(serializedPoint.contains('"value":0'), true);
  });
}