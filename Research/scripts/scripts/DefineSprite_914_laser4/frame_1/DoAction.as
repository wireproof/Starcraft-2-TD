function off()
{
   malp = true;
}
function fullOff(trg)
{
   delete this.onEnterFrame;
   trg = 0;
   ll._visible = false;
}
function kill(trg)
{
   malp = false;
   delete this.onEnterFrame;
   this.onEnterFrame = function()
   {
      if(!_parent[par])
      {
         trace("delete lazer");
         delete this.onEnterFrame;
         trg = 0;
         ll._visible = false;
         this.removeMovieClip();
      }
      xx = _root.ee["bot" + trg]._x - _X - _parent._x;
      yy = _root.ee["bot" + trg]._y - _Y - _parent._y;
      if(_root.ee["bot" + trg].t == 6)
      {
         yy -= 20;
      }
      if(_root.ee["bot" + trg].t == 8)
      {
         yy -= 30;
      }
      ll._yscale = Math.sqrt(xx * xx + yy * yy);
      if(malp || !_root.kl)
      {
         if(ll._alpha <= 10)
         {
            fullOff(trg);
         }
         ll._alpha -= 10;
      }
      else if(ll._alpha < 100)
      {
         ll._alpha += 10;
      }
      _rotation = (- Math.atan2(xx,yy)) * 180 / 3.141592653589793;
      _root.ee["bot" + trg].sp = Math.round(_root.ee["bot" + trg].ms * _root.damage[_root[prnt].t][_root[prnt].dam]);
   };
   _root.ee["bot" + trg].freeze(true);
   ll._visible = true;
}
off();
prnt = _name.substr(2,4);
ll._alpha = 0;
