package amaze;

abstract Cell(Side) from Side to Int {
  public var right(get, set) : Bool;
  public var top(get, set) : Bool;
  public var bottom(get, set) : Bool;
  public var left(get, set) : Bool;

  inline public function new(value : Int)
    this = value;

  inline function get_right() : Bool
    return 0 != (this & Side.right);

  inline function get_top() : Bool
    return 0 != (this & Side.top);

  inline function get_bottom() : Bool
    return 0 != (this & Side.bottom);

  inline function get_left() : Bool
    return 0 != (this & Side.left);


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

  @:op(A|=B) inline function bitwiseOrAssign(other : Side) : Cell
    return this |= other;
}

@:enum
abstract Side(Int) from Int to Int {
  var top = 1;
  var right = 2;
  var bottom = 4;
  var left = 8;
}