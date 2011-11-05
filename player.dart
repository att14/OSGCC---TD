class Player {
  int life, money;
  
  Player(this.life, this.money);
  
  bool canBuy(int cost)=> (life-cost > 0); 
  
  bool gameOver() => life < 0;
 } 
