class Title {
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  HTMLImageElement img;
  HTMLAudioElement audio;
  
  Title(){
    canvas = window.document.getElementById('canvas');
    ctx = canvas.getContext('2d');
    img = window.document.createElement('img');
    img.src = "images/intro.png";
    img.onload = (e){
      ctx.drawImage(img, 0 , 0);
      canvas.onmousedown = clickListener;
      audio = window.document.createElement('audio');
      audio.loop = true;
      audio.src = 'sounds/background.mp3';
      audio.autoplay = true;
    };
  }

  

  void clickListener(MouseEvent e){
    if(e.offsetX >= 152 && e.offsetX <= (152+183) && e.offsetY >= 540 && e.offsetY <= (540+89)){
      ctx.clearRect(0,0,canvas.width, canvas.height);
      canvas.onmousedown = (e){};
      new Game();
    }
    else if(e.offsetX >= 442 && e.offsetX <= (442+186) && e.offsetY >= 529 && e.offsetY <= (529+116)){
      ctx.clearRect(0,0,canvas.width, canvas.height);
      new Introduction();
      canvas.onmousedown = (e){};
    }
    
  }
}
