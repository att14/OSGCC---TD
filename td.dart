#import('dart:dom');
#source('player.dart');
#source('tower.dart');
#resource('td.html');

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
  new td().run();
}
