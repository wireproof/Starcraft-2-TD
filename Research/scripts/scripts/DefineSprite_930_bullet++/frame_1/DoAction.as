_root.s_1b.start();
_rotation = (- Math.atan2(_root.ee["bot" + trg]._x - _X,_root.ee["bot" + trg]._y - _Y)) * 180 / 3.141592653589793;
onEnterFrame = function()
{
   if(r._y > 500 || kill)
   {
      gotoAndStop(2);
   }
   r._y += 8;
   if(trg)
   {
      if(this.hitTest(_root.ee["bot" + trg].rr))
      {
         _root.ee["bot" + trg].nrg -= dam;
         if(_root.ee["bot" + trg].nrg <= 0)
         {
            _root.ee["bot" + trg].kill();
         }
         kill = r._y;
      }
   }
};
stop();
