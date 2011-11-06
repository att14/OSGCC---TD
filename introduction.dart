class Introduction {
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  HTMLImageElement img;
  
  Introduction(){
    canvas = window.document.getElementById('canvas');
    ctx = canvas.getContext('2d');
    img = window.document.createElement('img');
    img.src = "images/instructions.png";
    img.onload = (e){
      ctx.drawImage(img, 0 , 0);
      canvas.onmousedown = clickListener;

    };
  }

  
//
  void clickListener(MouseEvent e){
    if(e.offsetX >= 276 && e.offsetX <= (276+113) && e.offsetY >= 576 && e.offsetY <= (576+192)){
      ctx.clearRect(0,0,canvas.width, canvas.height);
      canvas.onmousedown = (e){};
      new Game();
    }
    
  }
}

