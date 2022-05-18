import 'dart:async';
import 'package:test/test.dart';
import 'exam.dart' as exam;

var log = [];

void Function() overridePrint(void Function() testFn) => () {
      var spec = ZoneSpecification(
          print: (Zone self, ZoneDelegate parent, Zone zone, String msg) {
        // Add to log instead of printing to stdout
        parent.print(zone, msg);
        parent.registerCallback(zone, () => parent.print(zone, "helloooo"));
        log.add(msg);
      });
      // return Zone.root.fork(specification: spec).run(testFn);
      return Zone.current.fork(specification: spec).run<void>(testFn);
    };

main() {
  test('override print', overridePrint(() => exam.main()));
}
