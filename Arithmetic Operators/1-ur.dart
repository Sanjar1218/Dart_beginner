void main() {
  var x = 6;
  x = 7;
  print(x.runtimeType);
}
//console output: Error: A value of type 'String' 
//can't be assigned to a variable of type 'int'.