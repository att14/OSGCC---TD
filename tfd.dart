#import('dart:dom');

#source('board.dart');
#source('player.dart');
#source('tower.dart');
#source('enemy.dart');
#source('game.dart');

void main() {
  Grid g = new Grid();
  Enemy e = new Enemy(0, 0, 10, 2, 10, 100, 10);
  for (int i = 0; i < 10000; i++) {
    window.setTimeout(f() {g.draw();e.draw();e.move();}, 100 * i);
  }
}
