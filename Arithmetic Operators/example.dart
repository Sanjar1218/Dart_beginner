import 'dart:io';

var f = File("1-ur.dart");

void main() {
  var text = f.readAsStringSync();
  text.split("\n").forEach((element) {
    print(element.contains("{"));
  });
}
