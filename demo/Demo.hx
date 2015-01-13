import amaze.Maze;

class Demo {
  public static function main() {
    var maze = new Maze(24, 12, new thx.math.random.PseudoRandom());
    maze.generate(0, 0);
    trace(maze.toString());
  }
}