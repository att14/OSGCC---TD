class Grid {
  List<List<GridElement>> cells;
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  
  Grid() {
    cells = new List<List<GridElement>>();
    HTMLDocument doc = window.document;
    canvas = doc.getElementById('canvas');
    ctx = canvas.getContext('2d');
    double size = canvas.width / Constants.SIZE;
    
    //generate map
    for (int i = 0; i < Constants.SIZE; i++) {
      cells.add(new List<GridElement>());
    }
    
    for (int i = 0; i < Constants.SIZE; i++) {
      cells[0].add(new GridElement(true, false, Constants.DOWN, false));
    }
    
    for (int i = 0; i < Constants.SIZE - 4; i++) {
      for (int j = 0; j < Constants.SIZE; j++) {
        cells[i].add(new GridElement(false, false, Constants.DOWN, false));
      }
    }
    
    for (int j = 0; j < Constants.SIZE; j++) {
      cells[Constants.SIZE - 4].add(new GridElement(false, true, Constants.DOWN, false));
    }
    
    for (int i = Constants.SIZE - 3; i < Constants.SIZE; i++) {
      for (int j = 0; j < Constants.SIZE; j++) {
        cells[i].add(new GridElement(false, false, Constants.DOWN, true));
      }
    }
    
    //draw map
    for (int i = 0; i < Constants.SIZE; i++) {
      for (int j = 0; j < Constants.SIZE; j++) {
        if (cells[i][j].start) {
          ctx.setFillColor('green');
          ctx.fillRect(size * i, size * j, size * i + size, size * j + size);
        } else if(cells[i][j].end) {
          ctx.setFillColor('red');
          ctx.fillRect(size * i, size * j, size * i + size, size * j + size);
        } else if(cells[i][j].castle) {
          ctx.setFillColor('gray');
          ctx.fillRect(size * i, size * j, size * i + size, size * j + size);
        } else {
          ctx.setFillColor('black');
          ctx.fillRect(size * i, size * j, size * i + size, size * j + size);
        }
      }
    }
  }
}

class GridElement {
  final bool s; //start
  final bool e; //end
  final int direction;
  final bool c; //castle
  int t; //tower
  
  GridElement(bool this.s, bool this.e, int this.direction, bool this.c) {
    t = Constants.TOWERLESS;
  }
  
  //getters
  int get tower() => t;
  int  get dir() => direction;
  bool get start() => s;
  bool get end() => e;
  bool get castle() => c;
  
  //setters
  int set tower(int type) => t = type;
}

class Constants {
  static final int SIZE = 10;
  static final UP = 1;
  static final DOWN = 2;
  static final LEFT = 3;
  static final RIGHT = 4;
  static final START = 5;
  static final END = 6;
  static final CASTLE = 7;
  static final TOWERLESS = 8;
  static final LONELYTOWER = 9;
  
  Constants() {}
}