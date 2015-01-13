package amaze;

import thx.math.random.PseudoRandom;

using thx.core.Ints;
using thx.core.Strings;
using thx.math.random.IRandom;

import amaze.Cell;

class Maze {
  public var width : Int;
  public var height : Int;
  public var cells : Array<Array<Cell>>;
  public var rgen : IRandom;
  public function new(width : Int, height : Int, rgen : IRandom) {
    this.width = width;
    this.height = height;
    this.rgen = null == rgen ? new PseudoRandom() : rgen;
  }

  function dx(side : Side) return switch side {
    case right:  1;
    case left:  -1;
    case top:    0;
    case bottom: 0;
  }

  function dy(side : Side) return switch side {
    case right:  0;
    case left:   0;
    case top:   -1;
    case bottom: 1;
  }

  function opposite(side : Side) return switch side {
    case right: left;
    case left: right;
    case top: bottom;
    case bottom: top;
  }

  public function generate(cx : Int, cy : Int) {
    if(cx < 0 || cx >= width) throw 'cs $cx is out of boundaries';
    if(cy < 0 || cy >= height) throw 'cs $cy is out of boundaries';

    cells = [for(y in 0...height) [for(x in 0...width) new Cell(0)]];

    function carve(cx : Int, cy : Int) {
      var directions = rgen.shuffle([Side.top, Side.bottom, Side.right, Side.left]);
      for(side in directions) {
        var nx = cx + dx(side),
            ny = cy + dy(side);
        if(ny >= 0 && ny < height && nx >= 0 && nx < width && cells[ny][nx] == 0) {
          cells[cy][cx] |= side;
          cells[ny][nx] |= opposite(side);
          carve(nx, ny);
        }
      }
    }

    carve(cx, cy);
  }

  public function toString() {
    if(null == cells) {
      return 'Maze (not generated)';
    } else {
      var out = [];
      out.push("_" + "_".repeat(width * 2 -1) + "_");
      for(y in 0...height) {
        var row = "|";
        for(x in 0...width) {
          row += cells[y][x] & Side.bottom != 0 ? " " : "_";
          if(cells[y][x] & Side.right != 0) {
            row += (cells[y][x] | cells[y][x+1]) & Side.bottom != 0 ? " " : "_";
          } else {
            row += "|";
          }
        }
        out.push(row);
      }

      return "\n" + out.join("\n") + "\n";
    }
  }
}