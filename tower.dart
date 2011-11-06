
class Tower {
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  int sight, hit, cost, x, y;
  bool drawable;
  static final int TAU = 2*Math.PI;
  Tower(this.cost, this.sight, this.hit){
    HTMLDocument doc = window.document;
    canvas = document.getElementById('canvas');
    ctx = canvas.getContext("2d");
    drawable = false;
  }
  void drawTower(){
    drawTowerOver();
    ctx.beginPath();
    ctx.setLineWidth(2);
    ctx.setFillColor("orange");
    ctx.setStrokeColor("orange");
    ctx.arc(x, y, 5, 0, TAU, false);
    ctx.fill();
    ctx.closePath();
    ctx.stroke();
  }
  void drawTowerOver(){
    ctx.beginPath();
    ctx.setLineWidth(2);
    ctx.setFillColor("rgba(51,102,255,.2)");
    ctx.setStrokeColor("rgb(61,0,245)");
    ctx.arc(x, y, sight, 0, TAU, false);
    ctx.fill();
    ctx.closePath();
    ctx.stroke();    
  }
  void placeTower(int ix,int iy){
    x = ix;
    y = iy;
    drawable = true;
    drawTower();
  }
  
  

}
