#import('dart:dom');

#source('board.dart');
#source('player.dart');
#source('tower.dart');
#source('enemy.dart');
#source('game.dart');

void main() {
  Grid g = new Grid();
  Enemy e = new Enemy(10, 10, 10, 2, 10, 10);
  e.draw();
  e.move();
  g.draw();
  e.draw();
}
