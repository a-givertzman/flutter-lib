import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart';

import 'helpers.dart';

void main() {
  group('DsCommand operator == comparison', () {
    final timestamp = DsTimeStamp.now();
    test('between wrong types', () {
      expect(getCommandWith(timestamp: timestamp) == 'command', false);
    });
    test('by class', () {
      expect(
        getCommandWith(dsClass: DsDataClass.requestTime, timestamp: timestamp) 
        == 
        getCommandWith(dsClass: DsDataClass.requestList, timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(dsClass: DsDataClass.requestTime, timestamp: timestamp) 
        == 
        getCommandWith(dsClass: DsDataClass.requestTime, timestamp: timestamp),
        true,
      );
    });
    test('by type', () {
      expect(
        getCommandWith(type: DsDataType.bool, timestamp: timestamp) 
        == 
        getCommandWith(type: DsDataType.dInt, timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(type: DsDataType.real, timestamp: timestamp) 
        == 
        getCommandWith(type: DsDataType.real, timestamp: timestamp),
        true,
      );
    });
    test('by path', () {
      expect(
        getCommandWith(path: 'path1', timestamp: timestamp) 
        ==
        getCommandWith(path: 'path2', timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(path: 'path', timestamp: timestamp) 
        ==
        getCommandWith(path: 'path', timestamp: timestamp),
        true,
      );
    });
    test('by name', () {
      expect(
        getCommandWith(name: 'name1', timestamp: timestamp) 
        == 
        getCommandWith(name: 'name2', timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(name: 'name', timestamp: timestamp) 
        == 
        getCommandWith(name: 'name', timestamp: timestamp),
        true,
      );
    });
    test('by value', () {
      expect(
        getCommandWith(value: 10, timestamp: timestamp) 
        == 
        getCommandWith(value: 20, timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(value: 10, timestamp: timestamp) 
        == 
        getCommandWith(value: 'test', timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(value: 10, timestamp: timestamp) 
        == 
        getCommandWith(value: 10, timestamp: timestamp),
        true,
      );
    });
    test('by status', () {
      expect(
        getCommandWith(status: DsStatus.ok, timestamp: timestamp) 
        == 
        getCommandWith(status: DsStatus.invalid, timestamp: timestamp),
        false,
      );
      expect(
        getCommandWith(status: DsStatus.ok, timestamp: timestamp) 
        == 
        getCommandWith(status: DsStatus.ok, timestamp: timestamp),
        true,
      );
    });
  });
}