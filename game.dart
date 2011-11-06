class Game{
  
  HTMLCanvasElement canvas, shop;
  HTMLImageElement anim1, anim2, anim3;
  HTMLAudioElement bloop, laser, baconarrow, goldfish;
  CanvasRenderingContext2D ctx, ctx2;
  int castle;
  ToolBar tool;
  
  ////////////////////////////////////////
  List<Tower> towers;
  List<Enemy> enemies;
  List<int> enemyLevelBarrier;
  List<double> probabilities;
  //////////////////////////////////////
  int kills;
  Player p;
  Grid grid;
  bool gameover;
  int en;
  Game(){
    //Canvas setting//////////////////////
    shop = window.document.getElementById('shop');
    ctx2 = shop.getContext('2d');
    canvas = window.document.getElementById('canvas');
    ctx = canvas.getContext('2d');
    ///////////////////////////////////////////////
    kills = 0;
    //Array init//////////////////////////////
    anim1 = window.document.createElement('img');
    anim1.src = "images/towers/blast.png";
    anim2 = window.document.createElement('img');
    anim2.src = "images/towers/bacon.png";
    anim3 = window.document.createElement('img');
    anim3.src = "images/towers/poured-lava.png";
    
    grid = new Grid();
    towers = new List<Tower>();
    enemies = new List<Enemy>();
    enemyLevelBarrier = new List<int>();
    probabilities = new List<double>();
    probabilities.add(1.0);
    probabilities.add(.3);
    probabilities.add(.1);
    probabilities.add(.05);
    probabilities.add(.01);
    probabilities.add(.08);
    enemyLevelBarrier.add(0);
    enemyLevelBarrier.add(100);
    enemyLevelBarrier.add(250);
    enemyLevelBarrier.add(200);
    enemyLevelBarrier.add(200);
    enemyLevelBarrier.add(200);
    p = new Player(10000,100);
    tool = new ToolBar(p);
    window.setTimeout((){    generateEnemy(kills,((Math.random()*700).floor())); }, 10000);
    ////////////////////////////////////////
    
    en = 0;
    gameover = false;
    castle = (750 *.69).floor();
    window.webkitRequestAnimationFrame(drawFrame, canvas);
    canvas.addEventListener("mousedown", (e){
      mouseClick(e);
    });
    shop.addEventListener("mousedown", (e){
      mouseToolbar(e);
    });
  }
  void mouseClick(MouseEvent e){
    if(e.offsetX >= castle && checkTower(e.offsetX, e.offsetY)){
      addTower(e.offsetX, e.offsetY);  
    }
  }
  void mouseToolbar(MouseEvent e){
    if(tool.mouseClick(e)){
      kills += enemies.length;
      tool.copernicium = false;
      enemies.removeRange(0, enemies.length-1);
    }
    else{
      for(final til in tool.tools){
        if(til.withinBox(e.offsetX, e.offsetY)){
          til.selected = true;
          en = til.type;
          print(en);
        }
        else{
          til.selected = false; 
        }
      }
    }
  }
  void drawFrame(int time){
    grid.draw();//Draw background
    
    //Ally delegation
    for(final tower in towers){
      tower.drawTower();
    }
    //////////////////
    
    //Enemy delegation
    for(int i = 0; i < enemies.length; i++){
      if(!enemies[i].move()){
        gameover = p.gameOver();
      }
      p.life -= enemies[i].attack;
 
      enemies[i].draw();
      delegateEnemy(enemies[i], i);
      }
    ////////////////////
    
    //Info update//////////////////
    ctx.font = "20pt Arial";
    ctx.setFillColor("red");
    tool.draw();
    ctx2.fillText("${p.displayLife()}", 10, 30);
    ctx2.fillText("Kills: $kills", 10, 50);
    ctx2.fillText("Moneyz: ${p.money}", 10, 70);

    ///////////////////////////////
    
    
    if(!gameover){
      window.webkitRequestAnimationFrame(drawFrame, canvas);      
    }
    else{
      grid.draw();
      ctx.font = "20pt Arial";
      ctx.setFillColor("red");
      ctx.fillText("GAME OVER SKULL FUCKER", 200, 50);
    }
  }
  
  
  //Check if tower can attack enemy
  void delegateEnemy(Enemy a, int i){
    for(final tower in towers){
      if(tower.intersect(a.x, a.y)){
        if(tower.fireRate){
          tower.fireRate = false;
          window.setTimeout(tower.fireRefresh,100);
          lazer(tower.x, tower.y, a.x, a.y, tower.swa);
          a.life-= tower.hit;
          if(a.life <= 0){
            enemies.removeRange(i, 1);
            kills++;
            p._money+=5;
            break;
         
          }          
          
        }

      }
    }
  }
  
  void addTower(int x, int y){
    Tower temp = new Tower(20, 105, 80, en);
    bool canBuy = p.buyTower(temp.cost);
    if (canBuy){
    temp.placeTower(x,y);
    towers.add(temp);
    }
  }
  bool checkTower(int x, int y){
    for(final tower in towers){
      if(tower.towerIntersect(x,y)){
        return false;
      }
    }
    return true;
  }
  void addEnemy(int i, num y){
    Enemy temp = new Enemy(-30, y, i, kills);
    enemies.add(temp); 
  }
  
  void generateEnemy(int killz, num y){
    int i = 0;

    for(i = enemyLevelBarrier.length-1; i > 0; i--){
      if(killz >= enemyLevelBarrier[i]){
        double percent = (probabilities[i]*100).floor();
        if((Math.random()*100).floor() <= percent){
          break;
        }
      }
    }
    addEnemy(i,y);
    if(!gameover){
      window.setTimeout((){    generateEnemy(kills,((Math.random()*700).floor())); }, 300);      
    }

    
  }
  void lazer(int ax, int ay, int bx, int by, int curr){
 

    switch(curr){
    case 0:
      ctx.drawImage(anim1, ax-anim1.width,ay-anim1.height/2);      
      ctx.drawImage(anim1, bx-anim1.width/2,by-anim1.height/2);
      baconarrow = window.document.createElement('audio');
      baconarrow.src = 'sounds/pew.ogg';
      baconarrow.autoplay = true;
      break;
    case 1:
      ctx.drawImage(anim3, bx,by);
      bloop = window.document.createElement('audio');
      bloop.src = 'sounds/pew.ogg';
      bloop.autoplay = true;
      break;
    case 3:
      ctx.drawImage(anim2, bx-anim2.width/2,by-anim2.height/2);
      laser = window.document.createElement('audio');
      laser.src = 'sounds/pew.ogg';
      laser.autoplay = true;
      break;
    default:
      ctx.setFillColor('orange');
      ctx.beginPath();
      ctx.moveTo(ax, ay);
      ctx.lineTo(bx, by);
      ctx.closePath();
      ctx.stroke();
      goldfish = window.document.createElement('audio');
      goldfish.src = 'sounds/pew.ogg';
      goldfish.autoplay = true;
      break;
    };


    
  }
  
}