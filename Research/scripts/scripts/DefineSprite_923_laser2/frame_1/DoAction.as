function off()
{
   rr._x = 900;
   malp = true;
}
function fullOff()
{
   delete this.onEnterFrame;
   rr._x = 900;
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
      rr._x = xx;
      rr._y = yy;
      ll._yscale = Math.sqrt(xx * xx + yy * yy);
      if(malp || !_root.kl)
      {
         if(ll._alpha <= 10)
         {
            fullOff();
         }
         ll._alpha -= 10;
      }
      else if(ll._alpha < 100)
      {
         ll._alpha += 10;
      }
      ll._rotation = (- Math.atan2(xx,yy)) * 180 / 3.141592653589793;
      if(!_root.gameOff)
      {
         _root.ee["bot" + trg].nrg -= Math.round(_root.damage[_root[prnt].t][_root[prnt].dam] * _root.armor[3][_root.ee["bot" + trg].t - 2]);
      }
      if(_root.ee["bot" + trg].nrg <= 0)
      {
         _root.ee["bot" + trg].kill();
         off();
      }
   };
   ll._visible = true;
}
off();
prnt = _name.substr(2,4);
ll._alpha = 0;
trace("lzr: " + _name);
