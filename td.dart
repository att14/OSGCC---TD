#import('dart:dom');
#source('player.dart');
#source('tower.dart');
//#resource('td.html');
#resource('index.html');

class td {

  td() {
    
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
  new Tower(100, 105, 100).placeTower(150,150);
  new Tower(100, 105, 100).placeTower(10,10);
  new Tower(100, 105, 100).placeTower(50,50);


}
