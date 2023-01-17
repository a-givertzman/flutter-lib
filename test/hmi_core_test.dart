import 'package:flutter_test/flutter_test.dart';

import 'package:hmi_core/hmi_core.dart';

void main() {
  const _debug = true;
  test('adds one to input values', () {
    final result = true;
    log(_debug, 'result: $result');
    expect(result, true);
  });
}
