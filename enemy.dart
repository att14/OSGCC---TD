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
  
  Enemy (this.x, this.y, this.size,int kills){
    castle = (750 *.75).floor();
    hit = false;
    HTMLDocument doc = window.document;
    canvas = doc.getElementById('canvas');
    ctx = canvas.getContext('2d');
    img = doc.createElement('img');

    switch(size){
    case 0:
      img.src = 'images/monsters/blob.png';
      sight = 10;
      speed = 3;
      damage = 10;
      health = 201+kills*3;
      break;
    case 1:
      img.src = 'images/monsters/blart.png';
      sight = 50;
      speed = 2;
      damage = 5;
      health = 101+kills*3;
      break;
    case 2:
      img.src = 'images/monsters/amoeba.png';
      sight = 10;
      speed = 1;
      damage = 15;
      health = 901+kills*3;
      break;
    case 3:
      img.src = 'images/monsters/boom.png';
      sight = 10;
      speed = 19+kills/100;
      damage = 100;
      health = 10;       
      break;
    case 4:
      img.src = 'images/monsters/skull-fucker.png';
      sight = 10;
      speed = 19;
      damage = 100;
      health = 10001+kills*3;   
      break;
    case 5:
      img.src = 'images/monsters/mickey.png';
      sight = 100;
      speed = 2;
      damage = 14;
      health = 80+kills*3;   
      break;
    }

    img.onload = (e) {
      if((y-img.height/2)< 0){
        y = y + img.height/2;
      }
      ctx.drawImage(img, x-(img.width/2).floor(), y-(img.height/2).floor());
    };
  }
  
  bool move() {
    
    if (hit == true) {
      return false;
    }else {
      int distance = castle-x;
      if(distance <= sight){
        hit = true;
      }
      else{
      x += speed;
      }
      if (x + size >= castle) {
        x = castle - size;
        hit = true;
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