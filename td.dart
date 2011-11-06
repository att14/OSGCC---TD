#import('dart:dom');
#source('player.dart');
#source('tower.dart');
//#resource('td.html');
#resource('index.html');

class td {
  List<Tower> towers;
  td() {
    
  }
  void onMouseMove(){
    //HTMLCanvasElement can =document.getElementById('canvas');
    
  }
  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the DOM library defines a global "window" variable
    HTMLDocument doc = window.document;
    HTMLParagraphElement p = doc.createElement('p');
    p.innerText = message;
    doc.body.appendChild(p);
  }
}

void main() {
  Tower c = new Tower(100, 105, 100);
  c.placeTower(150,150);
  Tower a = new Tower(100, 105, 100);
  a.placeTower(10,10);
  Tower b = new Tower(100, 105, 100);
  b.placeTower(50,50);
  if(a.intersect(b.x, b.y)){
  }
  new td().write("${a.intersect(b.x, b.y)}");
  new td().write("${a.intersect(c.x, c.y)}");

}
