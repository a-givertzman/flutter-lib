
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group('DsCommand fromJson()', () {
    group('with incorrect', () {
      test('empty map', () {
        testIfThrows({});
      });
      test('not full map', () {
        testIfThrows({
          'path': 'abc',
          'name': 'abc',
        });
      });
      test('class', () {
        testIfThrows({
          'class': 0,
          'type': 'bool',
          'path': 'abc',
          'name': 'bdc',
          'value': 0,
          'status': 0,
          'timestamp': DateTime.now().toString(),
        });
      });
      test('type', () {
        testIfThrows({
          'class': 'requestAll',
          'type': 0,
          'path': 'abc',
          'name': 'bdc',
          'value': 0,
          'status': 0,
          'timestamp': DateTime.now().toString(),
        });
      });
      test('status', () {
        testIfThrows({
          'class': 'requestAll',
          'type': 'bool',
          'path': 'abc',
          'name': 'abc',
          'value': 0,
          'status':'abc',
          'timestamp': DateTime.now().toString(),
        });
      });
      test('timestamp', () {
        testIfThrows({
          'class': 'requestAll',
          'type': 'bool',
          'path': 'abc',
          'name': 'bdc',
          'value': 0,
          'status': 0,
          'timestamp': 0,
        });
      });
    });
    group('with correct', () {
      test('string', () {

      });
    });
  });
}