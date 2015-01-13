import amaze.*;
import js.html.CanvasRenderingContext2D;
import thx.math.random.PseudoRandom;

class Demo {
  public static function main() {
    var cols = 24,
        rows = 12,
        size = 20,
        maze = new Maze(cols, rows, new PseudoRandom());
    maze.generate(0, 0);
    trace(maze.toString());
    MiniCanvas.create(cols * size, rows * size)
      .with(function(mini) {
        mini.fill("rgba(255,255,255,1)");
        mini.ctx.beginPath();
        for(row in 0...maze.cells.length) {
          var cells = maze.cells[row];
          for(col in 0...cells.length) {
            var cell = cells[col];
            drawCell(mini.ctx, cell, row, col, size);
          }
        }
        mini.ctx.stroke();
        mini.border();
      })
      .display("maze");
  }

  static function drawCell(ctx : CanvasRenderingContext2D, cell : Cell, row : Int, col : Int, size : Int) {
    if(!cell.right) {
      ctx.moveTo(0.5 + (1 + col) * size, 0.5 + row * size);
      ctx.lineTo(0.5 + (1 + col) * size, 0.5 + (row + 1) * size);
    }
    if(!cell.bottom) {
      ctx.moveTo(0.5 + col * size, 0.5 + (1 + row) * size);
      ctx.lineTo(0.5 + (col + 1) * size, 0.5 + (1 + row) * size);
    }
  }
}