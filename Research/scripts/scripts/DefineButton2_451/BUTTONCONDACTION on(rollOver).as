on(rollOver){
   if(_parent._currentframe == 30 || _parent._currentframe == 80 || _parent._name == "msg" || _parent._parent._name == "sett")
   {
      _root.s_bh.start();
      if(_currentframe > 10)
      {
         gotoAndPlay(20 - _currentframe);
      }
      else
      {
         play();
      }
   }
}
