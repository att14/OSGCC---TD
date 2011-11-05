class Player {
  int _life, _money;
  
  Player(this._life, this._money);

  //getters + setters for life
  int get life() => _life;
  void set life(newLife){
    _life = newLife;
  }
///////////////////////


  void set money(newMoney){
    if(newMoney >= 0){
         _money = newMoney;   
    }
   }
  int get money()=> _money;

  bool gameOver() => life < 0;

//Returns false if you do not have enough money
  bool buyTower(int cost){
    if(life-cost >= 0){
      this._money -= cost;
      return true;
    }
    return false;
  }
 }