class Toolbox {
  HTMLCanvasElement shop;
  CanvasRenderingContext2D ctx;
  int x, y, width, height, sight, type, hit;//Top left corner
  bool selected;
  String src;
  Toolbox(this.x,this.y, this.sight, this.type, this.hit, String this.src){
    shop = document.getElementById('shop');
    ctx = shop.getContext('2d');
    width = 75;
    height = 75;
    selected = false;
  }
  
  bool withinBox(int nx, int ny)=> nx >= (x)&& nx <= (x+width)&& ny >= (y) && ny <= (y+ny);
      
   void draw(){
     if(selected){
       ctx.setFillColor("rgba(140,84,48, .9)");
     }
     else{
       ctx.setFillColor("rgba(162, 171,165, .9)");       
     }
     ctx.fillRect(65,y, width, height);
   }
}
