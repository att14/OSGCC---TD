class Grid {
  List<List<GridElement>> cells;
  HTMLCanvasElement canvas;
  HTMLImageElement img;
  HTMLAudioElement audio;
  CanvasRenderingContext2D ctx;
  
  Grid() {
    cells = new List<List<GridElement>>();
    HTMLDocument doc = window.document;
    canvas = doc.getElementById('canvas');
    ctx = canvas.getContext('2d');
    
    img = doc.createElement('img');
    img.src = 'images/background.png';
    img.onload = (e) {
      ctx.drawImage(img, 0, 0, 750, 750);
    };
    
//    audio = doc.createElement('audio');
//    audio.loop = true;
//    audio.src = 'audio/background.mp3';
//    audio.autoplay = true;
    
    //generate map
    for (int i = 0; i < Constants.SIZE; i++) {
      cells.add(new List<GridElement>());
    }
    
    for (int i = 0; i < Constants.SIZE; i++) {
      cells[0].add(new GridElement(0, i, true, false, Constants.DOWN, false));
    }
    for (int i = 1; i < (Constants.SIZE * .8).floor(); i++) {
      for (int j = 0; j < Constants.SIZE; j++) {
        cells[i].add(new GridElement(i, j, false, false, Constants.DOWN, false));
      }
    }
    
    for (int i = (Constants.SIZE *.8).floor(); i < Constants.SIZE; i++) {
      for (int j = 0; j < Constants.SIZE; j++) {
        cells[i].add(new GridElement(i, j, false, false, Constants.DOWN, true));
      }
    }
    
    //draw map
    draw();
  }
  
  void draw() {
      ctx.drawImage(img, 0, 0, 750, 750);
  }
}

class GridElement {
  final int X;
  final int Y;
  final bool s; //start
  final bool e; //end
  final int direction;
  final bool c; //castle
  int t; //tower
  
  GridElement(int this.X, int this.Y, bool this.s, bool this.e, int this.direction, bool this.c) {
    t = Constants.TOWERLESS;
  }
  
  //getters
  int get x() => X;
  int get y() => Y;
  int get tower() => t;
  int  get dir() => direction;
  bool get start() => s;
  bool get end() => e;
  bool get castle() => c;
  
  //setters
  int set tower(int type) => t = type;
}

class Constants {
  static final int SIZE = 150;
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
