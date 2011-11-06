class Game{
  HTMLCanvasElement canvas;
  CanvasRenderingContext2D ctx;
  List<Tower> towers;
  List<Enemy> enemies;
  Player p;
  Grid grid;
  Game(){
    canvas = window.document.getElementById('canvas');
    ctx = canvas.getContext('2d');
    grid = new Grid();
    towers = new List<Tower>();
    enemies = new List<Enemy>();
    Enemy r = new Enemy(54, 32, 10, 5, 100, 100, 10);
    enemies.add(r);
    Tower c = new Tower(100, 105, 100);
    c.placeTower(150,150);
    Tower a = new Tower(100, 105, 100);
    a.placeTower(10,10);
    Tower b = new Tower(100, 105, 100);
    b.placeTower(50,50);
  
    p = new Player(10000,1000);
    window.webkitRequestAnimationFrame(drawFrame, canvas);
    canvas.addEventListener("mousedown", (e){
      mouseClick(e);
    });

  }
  void mouseClick(MouseEvent e){
    addTower(e.offsetX, e.offsetY);
  }
  void drawFrame(int time){
    grid.draw();
    
    for(final tower in towers){
      tower.drawTower();
    }
    for(int i = 0; i < enemies.length; i++){
      bool movement = enemies[i].move();
      if(!movement){
        p.life -= enemies[i].attack;
      }
      enemies[i].draw();
      delegateEnemy(enemies[i], i);
      }
    addEnemy((Math.random()*300).floor());
    ctx.font = "20pt Arial";
    ctx.setFillColor("red");
    ctx.fillText("${p.displayLife()}", 600, 50);
    window.webkitRequestAnimationFrame(drawFrame, canvas);
  }
  
  void delegateEnemy(Enemy a, int i){
    for(final tower in towers){
      if(tower.intersect(a.x, a.y)){
        if(tower.fireRate){
          
          tower.fireRate = false;
          window.setTimeout(tower.fireRefresh,100);
          lazer(tower.x, tower.y, a.x, a.y);
          a.life-= tower.hit;
          if(a.life < 0){
            enemies.removeRange(i, 1);
            break;
         
          }          
          
        }

      }
    }
  }
  
  void addTower(int x, int y){
    Tower temp = new Tower(100, 105, 100);
    temp.placeTower(x,y);
    towers.add(temp);
  }
  void addEnemy( num y){
    Enemy temp = new Enemy(-30, y, 10, 5, 100, 100, 10);;
    enemies.add(temp); 
  }
  void lazer(int ax, int ay, int bx, int by){
    ctx.setFillColor('orange');
    ctx.beginPath();
    ctx.moveTo(ax, ay);
    ctx.lineTo(bx, by);
    ctx.closePath();
    ctx.stroke();
    
  }
  
}