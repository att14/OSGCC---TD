class Tower {
  HTMLCanvasElement canvas;
  HTMLImageElement img;
  CanvasRenderingContext2D ctx;
  int sight, hit, cost, x, y, swa;
  bool drawable, over, fireRate;
  static final int TAU = 2*Math.PI;
  Tower(this.cost, this.sight, this.hit, int swap){
    HTMLDocument doc = window.document;
    canvas = document.getElementById('canvas');
    img = doc.createElement('img');
    swa = swap;
    switch(swap){
    case 0:
      img.src = "images/towers/cannon.png";
      sight = 100;
      hit = 80;
      cost = 10;
      break;
    case 1: 
      img.src = "images/towers/lava.png";
      sight = 50;
      hit = 400;
      cost = 35;
      break;
    case 3: 
      img.src = "images/towers/bacon-arrow.png";
      sight = 400;
      hit = 900;
      cost = 1000;
      break;
    case 2: 
      img.src = "images/towers/goldy.png";
      sight = 150;
      hit = 200;
      cost = 100;
      break;
    }
    
    ctx = canvas.getContext("2d");
    addEventHandlers();
    drawable = false;
    fireRate = true;
  }
  
  void addEventHandlers(){
    canvas.addEventListener("mousemove", this.onMouseMove, true);
  }
  void drawTower(){
    if(drawable){
      if(over){
        drawTowerOver("rgba(48, 107, 255, .6)", "rgb(0,0,0)");
      }
      ctx.drawImage(img, x-(img.width/2).floor(), y-(img.height/2).floor());
    }

  }
  void fireRefresh(){
    fireRate = true;
  }
  void onMouseMove(MouseEvent e){
    int mouseX = e.offsetX;
    int mouseY = e.offsetY;
    if(this.towerIntersect(mouseX, mouseY)){
      over = true;
    }
    else{
      over = false;
    }
  }
  void drawTowerOver(String color, String color2){
    ctx.beginPath();
    ctx.setLineWidth(2);
    ctx.setFillColor(color);
    ctx.setStrokeColor(color2);
    ctx.arc(x, y, sight, 0, TAU, false);
    ctx.fill();
    ctx.closePath();
    ctx.stroke();    
  }
  bool intersect(int x_i, int y_i) => ((x_i-x)*(x_i-x) + (y_i-y)*(y_i-y)-sight*sight) <= 0;
 

  bool towerIntersect(int x_i, int y_i) => (x_i >= x-(img.width)/2.floor() && x_i <= x+(img.width)/2.floor() && y_i >= y-(img.height)/2.floor()&& y_i <= y+(img.height)/2.floor());
  
  void placeTower(int ix,int iy){
    x = ix;
    y = iy;
    drawable = true;
    //drawTower();
  }
  
  

}
