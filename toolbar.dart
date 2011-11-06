class ToolBar {
  HTMLCanvasElement shop;
  HTMLImageElement background;
  HTMLImageElement img;
  CanvasRenderingContext2D ctx;
  Player p;
  
  ToolBar(this.p) {
    shop = window.document.getElementById('shop');
    ctx = shop.getContext('2d');
    
    background = window.document.createElement('img');
    background.src = 'images/paper-2.png';
    background.onload = (e) {
      ctx.drawImage(background, 0, 0);
      ctx.font = "15pt Arial";
      ctx.setFillColor("red");
      ctx.fillText("${p.displayLife()}", 10, 30);
      
      fillToolBar();
    };
    
    shop.addEventListener("mousedown", (e){
      mouseClick(e);
    });
  }
  
  void mouseClick(MouseEvent e) {
    if (e.offsetX >= ((shop.width-img.width)/2) && e.offsetX <= ((shop.width-img.width)/2 +img.width) && e.offsetY >= 600 && e.offsetY >= 600 - img.height) {
      
    }
  }
  
  void fillToolBar() {
    drawImage('images/towers/copernicium.png');
  }
  
  void drawImage(String s) {
    img = window.document.createElement('img');
    img.src = s;
    img.onload = (e) {
      ctx.drawImage(img, (shop.width-img.width)/2, 600);
    };
  }
}
