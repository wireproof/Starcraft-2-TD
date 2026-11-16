r._visible = false;
s1._visible = false;
r1._visible = false;
qwer = 15;
_root.s_mis.start();
onEnterFrame = function()
{
   if(!_parent[par])
   {
      trace("delete SNYPER BULLET");
      delete this.onEnterFrame;
      trg = 0;
      this.removeMovieClip();
   }
   if(!_root.gameOff)
   {
      if(sp > 0)
      {
         r._visible = true;
         r._y = r._y + sp + qwer;
         sp++;
         qwer++;
         if(trg)
         {
            if(!_root.ee["bot" + trg])
            {
               s1._y = _parent[secrok].r._y;
               r._visible = false;
               s1._visible = true;
               s1.play();
               delete onEnterFrame;
            }
            _rotation = (- Math.atan2(_root.ee["bot" + trg]._x - _X,_root.ee["bot" + trg]._y - _Y)) * 180 / 3.141592653589793;
            if(this.hitTest(_root.ee["bot" + trg].rr))
            {
               _root.s_exp.start();
               r._visible = false;
               if(_root.ee["bot" + trg].t > 2)
               {
                  r1._y = r._y;
                  r1._rotation = int(Math.random() * 360);
                  r1._visible = true;
                  r1.play();
               }
               else
               {
                  s1._y = r._y;
                  s1._visible = true;
                  s1.play();
               }
               delete onEnterFrame;
               _root.ee["bot" + trg].nrg -= int(dam * _root.armor[4][_root.ee["bot" + trg].t - 2]);
               if(_root.ee["bot" + trg].nrg <= 0)
               {
                  _root.ee["bot" + trg].kill();
               }
               i = 1;
               while(i < _root.n)
               {
                  if(trg !== i && Math.abs(_root.ee["bot" + trg]._x - _root.ee["bot" + i]._x) < 60 && Math.abs(_root.ee["bot" + trg]._y - _root.ee["bot" + i]._y) < 60)
                  {
                     _root.ee["bot" + i].nrg -= int(dam * _root.armor[1][_root.ee["bot" + trg].t - 2] / 2);
                     if(_root.ee["bot" + i].nrg <= 0)
                     {
                        _root.ee["bot" + i].kill();
                     }
                  }
                  i++;
               }
            }
         }
         if(sp > 36)
         {
            trace("sp>36 for rocket");
            delete onEnterFrame;
            this.removeMovieClip();
         }
      }
      else
      {
         if(!_root.ee["bot" + trg]._x)
         {
            trace("no trg for rocket");
            delete onEnterFrame;
            this.removeMovieClip();
         }
         r._visible = false;
         sp++;
         if(sp == 0)
         {
         }
      }
   }
};
