# amaze

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/seriousbiz/amaze?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Maze generation lib.

Example:

```haxe
var maze = new Maze(24, 12, new PseudoRandom());
maze.generate(0, 0);
trace(maze.toString());
```

Generates:

```
_________________________________________________
| |___________  |  ___     _______  | |  _____  |
| |  _______  | | |  ___|_|  _  | | |_______  | |
|___|___   _| |  _|___  |  _|  _| |___  |_____| |
| |    ___|  _|_______|___|  _| |    _|_____  | |
|  _|___  | |    _  |  _____|  _| | |  ___  | | |
| |___  |___|_|_  |___|  _  |   | |___|  _  |_  |
|___  |_   ___  | |   | | | |_| |_  |  _| |_  | |
|  _|_____|  ___| | |_____|_  |_____| |  _|  _| |
|  _   _|  _|_____  | |  _____|   |  _|   | | | |
|_  |_  | |_   _  |_  |_________| | |___|  ___| |
| | |  _|_____| |_  |_|  _________| |   |___|  _|
|___|___________________|_____________|_________|
```

Or with canvas:

![maze](https://github.com/seriousbiz/amaze/raw/master/images/maze.png?raw=true "maze")