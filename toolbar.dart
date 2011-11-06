class ToolBar {
  HTMLCanvasElement shop;
  HTMLImageElement background;
  CanvasRenderingContext2D ctx;
  
  ToolBar() {
    shop = window.document.getElementById('shop');
    print(shop.width);
    ctx = shop.getContext('2d');
    ctx.setFillColor('black');
    ctx.fillRect(0, 0, 200, 750);
    
    HTMLImageElement img = document.createElement('img');
    img.src = 'images/towers/copernicium.png';
    img.onload = (e) {
      ctx.drawImage(img, 0, 0);
    };
  }
}
