package amaze;

@:enum
abstract Side(Int) from Int to Int {
  var top = 1;
  var right = 2;
  var bottom = 4;
  var left = 8;
}