class Player {
  int _life, totalLife, _money;
  
  Player(this._life, this._money){
    totalLife = _life;
  }

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
  String displayMoney() => "Money: $_money";
  String displayLife()=> "Life: $_life/$totalLife";
//Returns false if you do not have enough money
  bool buyTower(int cost){
    if((this._money-cost) >= 0){
      this._money -= cost;
      return false;
    }
    return true;
  }
 }