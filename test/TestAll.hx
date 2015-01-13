import utest.Assert;
import utest.Runner;
import utest.ui.Report;

import amaze.*;

class TestAll {
  public static function main() {
    var runner = new Runner();
    runner.addCase(new TestAll());
    Report.create(runner);
    runner.run();
  }

  public function new() {}

  public function testMazeCell() {
    var cell = new Cell(0);
    Assert.isFalse(cell.top);
    Assert.isFalse(cell.left);
    Assert.isFalse(cell.right);
    Assert.isFalse(cell.bottom);

    cell.top = true;

    Assert.isTrue(cell.top);
    Assert.isFalse(cell.left);
    Assert.isFalse(cell.right);
    Assert.isFalse(cell.bottom);

    cell.left = true;

    Assert.isTrue(cell.top);
    Assert.isTrue(cell.left);
    Assert.isFalse(cell.right);
    Assert.isFalse(cell.bottom);

    cell.right = true;

    Assert.isTrue(cell.top);
    Assert.isTrue(cell.left);
    Assert.isTrue(cell.right);
    Assert.isFalse(cell.bottom);

    cell.bottom = true;

    Assert.isTrue(cell.top);
    Assert.isTrue(cell.left);
    Assert.isTrue(cell.right);
    Assert.isTrue(cell.bottom);

    cell.top = false;

    Assert.isFalse(cell.top);
    Assert.isTrue(cell.left);
    Assert.isTrue(cell.right);
    Assert.isTrue(cell.bottom);

    cell.left = false;

    Assert.isFalse(cell.top);
    Assert.isFalse(cell.left);
    Assert.isTrue(cell.right);
    Assert.isTrue(cell.bottom);

    cell.right = false;

    Assert.isFalse(cell.top);
    Assert.isFalse(cell.left);
    Assert.isFalse(cell.right);
    Assert.isTrue(cell.bottom);

    cell.bottom = false;

    Assert.isFalse(cell.top);
    Assert.isFalse(cell.left);
    Assert.isFalse(cell.right);
    Assert.isFalse(cell.bottom);
  }
}