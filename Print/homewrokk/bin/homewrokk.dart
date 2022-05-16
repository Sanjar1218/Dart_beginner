import 'dart:async';
import 'package:test/test.dart';

var log = [];
void Function() overridePrint(void Function() testFn) => () {
      var spec = ZoneSpecification(print: (_, __, ___, String msg) {
        // Add to log instead of printing to stdout
        log.add(msg);
      });
      return Zone.current.fork(specification: spec).run<void>(testFn);
    };

main() {
  test('override print', overridePrint(() {
    print('hello');
    expect(log, ['hello']);
  }));
}
