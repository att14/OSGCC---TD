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
  HTMLImageElement img;
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  
  Enemy (this.x, this.y, this.sight, this.speed, this.damage, this.health, this.size){
    castle = (750 *.75).floor();
    hit = false;
    HTMLDocument doc = window.document;
    canvas = doc.getElementById('canvas');
    ctx = canvas.getContext('2d');
    
    img = doc.createElement('img');
    img.src = 'images/monsters/blob.png';
    img.onload = (e) {
      if((y-img.height/2)< 0){
        y = y + img.height/2;
      }
      ctx.drawImage(img, x-(img.width/2).floor(), y-(img.height/2).floor());
    };
  }
  
  bool move() {
    double distance = Math.sqrt(Math.pow(x - castle, 2));
    if (distance < sight) {
      hit = true;
    }
    
    if (hit == true) {
      return false;
    }else {
      x += speed;
      if (x + size >= castle) {
        x = castle - size;
      }
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
  void set life(int newLife){
    health = newLife;
  }
  void draw() {
    ctx.drawImage(img, x-(img.width/2).floor(), y-(img.height/2).floor());
  }
}