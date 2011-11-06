class ToolBar {
  HTMLCanvasElement shop;
  HTMLImageElement background;
  HTMLImageElement img1, img;
  List<Toolbox> tools;
  CanvasRenderingContext2D ctx;
  Player p;
  int wset;
  bool copernicium;  
  ToolBar(this.p) {
    copernicium = true;
    shop = window.document.getElementById('shop');
    ctx = shop.getContext('2d');
    wset = 10;
    background = window.document.createElement('img');
    img = window.document.createElement('img');
    img.src = 'images/towers/copernicium-used.png';
   
    tools = new List<Toolbox>();
    tools.add(new Toolbox(0, 0, 10, 1, 190, "images/towers/lava.png"));
    background.src = 'images/paper-2.png';
    background.onload = (e) {
      ctx.drawImage(background, 0, 0);
      ctx.font = "15pt Arial";
      ctx.setFillColor("red");
      ctx.fillText("${p.displayLife()}", 10, 30);

    };
    img1 = window.document.createElement('img');
    img1.src = 'images/towers/copernicium.png';
    img1.onload = (e){
    //ctx.drawImage(img, (img.width)/2.floor() , 600);
    ctx.drawImage(img1, (shop.width-img1.width)/2 , 600);
    };
  }
  void draw(){
    ctx.drawImage(background, 0, 0);
    tools[0].draw();
    if(copernicium){
      ctx.drawImage(img1, (shop.width-img1.width)/2 , 600);      
    }
    else{
      ctx.drawImage(img, (shop.width-img1.width)/2 , 600);      

    }
  }
  
  bool mouseClick(MouseEvent e) {
    if (copernicium && e.offsetX >= ((shop.width-img1.width)/2) && e.offsetX <= ((shop.width-img1.width)/2 +img1.width) && e.offsetY >= 600 && e.offsetY >= 600 - img1.height) {
      return true; 
    }
    return false;
  }
  
  

  /*
  void drawImage(String s) {
    img = window.document.createElement('img');
    img.src = s;
    img.onload = (e) {
      ctx.drawImage(img, (shop.width-img.width)/2, 600);
    };
  }*/
}
