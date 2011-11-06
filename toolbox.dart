class Toolbox {
  HTMLCanvasElement shop;
  CanvasRenderingContext2D ctx;
  HTMLImageElement img;
  int x, y, width, height, sight, type, hit;//Top left corner
  bool selected;
  bool drawImg;
  String src;
  Toolbox(this.x,this.y, this.sight, this.type, this.hit, String this.src){
    shop = window.document.getElementById('shop');
    ctx = shop.getContext('2d');
    width = 55;
    height = 55;
    selected = false;
    img = window.document.createElement('img');
    img.src = this.src;
    img.onload= (e){
      ctx.drawImage(img,75,y, 55, 55);
      //ctx.drawImage(img,0,0);

      
    };
  }
  
  bool withinBox(int nx, int ny)=> nx >= (75)&& nx <= (75+width)&& ny >= (y) && ny <= (y+height);
      
   void draw(){
    
     if(selected){
       ctx.setFillColor("rgba(140,84,48, .9)");
     }
     else{
       ctx.setFillColor("rgba(162, 171,165, .9)");       
     }
     ctx.fillRect(65,y, width, height);
     ctx.drawImage(img,65,y, width, height);


   }
}
