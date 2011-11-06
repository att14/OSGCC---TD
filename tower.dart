class Tower {
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  int sight, hit, cost, x, y;
  bool drawable, over, fireRate;
  static final int TAU = 2*Math.PI;
  Tower(this.cost, this.sight, this.hit){
    HTMLDocument doc = window.document;
    canvas = document.getElementById('canvas');
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
      ctx.beginPath();
      ctx.setLineWidth(2);
      ctx.setFillColor("orange");
      ctx.setStrokeColor("orange");
      ctx.arc(x, y, 5, 0, TAU, false);
      ctx.fill();
      ctx.closePath();
      ctx.stroke();      
    }

  }
  void fireRefresh(){
    fireRate = true;
  }
  void onMouseMove(MouseEvent e){
    int mouseX = e.offsetX;
    int mouseY = e.offsetY;
    if(this.intersect(mouseX, mouseY)){
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
  
  void placeTower(int ix,int iy){
    x = ix;
    y = iy;
    drawable = true;
    //drawTower();
  }
  
  

}
