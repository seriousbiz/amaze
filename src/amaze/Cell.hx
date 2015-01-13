package amaze;

abstract Cell(Side) {
  public var right(get, set) : Bool;
  public var top(get, set) : Bool;
  public var bottom(get, set) : Bool;
  public var left(get, set) : Bool;

  public function new(value : Int)
    this = value;

  inline function get_right() : Bool
    return Side.right == this & Side.right;

  inline function get_top() : Bool
    return Side.top == this & Side.top;

  inline function get_bottom() : Bool
    return Side.bottom == this & Side.bottom;

  inline function get_left() : Bool
    return Side.left == this & Side.left;


  inline function set_right(v) : Bool {
    this = v ? this | Side.right : this ^ Side.right;
    return v;
  }
  inline function set_top(v) : Bool {
    this = v ? this | Side.top : this ^ Side.top;
    return v;
  }
  inline function set_bottom(v) : Bool {
    this = v ? this | Side.bottom : this ^ Side.bottom;
    return v;
  }
  inline function set_left(v) : Bool {
    this = v ? this | Side.left : this ^ Side.left;
    return v;
  }
}

@:enum
abstract Side(Int) from Int to Int {
  var top = 1;
  var right = 2;
  var bottom = 4;
  var left = 8;
}