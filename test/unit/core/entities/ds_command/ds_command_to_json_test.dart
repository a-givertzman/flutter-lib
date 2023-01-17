import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

import 'helpers.dart';

void main() {
  group('DsCommand toJson()', () {
      final timestamp = DsTimeStamp.now();
      // int
      test('with int value', () {
        expect(
          getCommandWith(value: 0, timestamp: timestamp).toJson(), 
          getStringifiedCommandWithValue(0, timestamp),
        );
      });
      test('with double value', () {
        expect(
          getCommandWith(value: 0.5, timestamp: timestamp).toJson(), 
          getStringifiedCommandWithValue(0.5, timestamp),
        );
      });
      test('with string value', () {
        expect(
          getCommandWith(value: 'test', timestamp: timestamp).toJson(), 
          getStringifiedCommandWithValue('test', timestamp),
        );
      });
      test('with bool value', () {
        expect(
          getCommandWith(value: true, timestamp: timestamp).toJson(), 
          getStringifiedCommandWithValue(true, timestamp),
        );
      });      
    });
}