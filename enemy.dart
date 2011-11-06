class Enemy {
  int x;
  int y;
  int sight;
  int damage;
  int speed;
  int castle;
  int health;
  int size;
  bool hit;
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  
  Enemy (this.x, this.y, this.sight, this.speed, this.damage, this.health, this.size){
    castle = (Constants.SIZE *.8).ceil();
    hit = false;
    HTMLDocument doc = window.document;
    canvas = document.getElementById('canvas');
    ctx = canvas.getContext('2d');
  }
  
  bool move() {
    double distance = Math.sqrt(Math.pow(y - castle, 2));
    if (distance < castle) {
      hit = true;
    }
    
    if (hit == true) {
      return false;
    }else {
      y += speed;
      return true;
    }
  }
  
  int get attack() { 
    if (hit == true) {
      return damage;
    } else {
      return 0;
    }
  }
  
  int get life() => health;
  
  void draw() {
    ctx.setFillColor('orange');
    ctx.fillRect(x, y, size, size);
  }
}