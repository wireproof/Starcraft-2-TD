function freeze(v)
{
   if(v)
   {
      Freeze.setTransform(freezeColor);
   }
   else
   {
      Freeze.setTransform(normalColor);
   }
}
function ind()
{
   nrgs.gotoAndStop(50 - nrg / 2);
}
function kill()
{
   if(_root.hand_target2 == 1 and _root.target_par == n)
   {
      _root.hand_target2 = 0;
   }
   trace("смерть");
   delete onEnterFrame;
   _root.money += killmoney;
   _root.score += killmoney;
   _root.kl = _root.kl - 1;
   if(_root.kl == 0)
   {
      _root.gotoAndStop("next");
   }
   switch(t)
   {
      case 2:
         _parent._parent.attachMovie("_bang_m","b" + _parent._parent.nr,50 + _parent._parent.nr++,{_x:_X,_y:_Y,n:n});
         rn = Math.random();
         if(rn < 0.33)
         {
            _root.s_md1.start();
         }
         else if(rn < 0.66)
         {
            _root.s_md2.start();
         }
         else
         {
            _root.s_md3.start();
         }
         break;
      case 3:
         _root.s_vd.start();
         _parent._parent.attachMovie("_bang","b" + _parent._parent.nr,6000 + _parent._parent.nr++,{_x:_X,_y:_Y,n:n,_xscale:50,_yscale:50});
         break;
      case 4:
         _root.s_tnd.start();
         _parent._parent.attachMovie("_bang","b" + _parent._parent.nr,6000 + _parent._parent.nr++,{_x:_X,_y:_Y,n:n});
         _root.vibra(5);
         break;
      case 5:
         _root.s_tnd.start();
         _parent._parent.attachMovie("_bang","b" + _parent._parent.nr,6000 + _parent._parent.nr++,{_x:_X,_y:_Y,n:n,_xscale:80,_yscale:80});
         break;
      case 7:
         _root.s_hd.start();
         _parent._parent.attachMovie("_bang","b" + _parent._parent.nr,6000 + _parent._parent.nr++,{_x:_X,_y:_Y,n:n,_xscale:80,_yscale:80});
         break;
      case 6:
         _root.s_bnd.start();
         _parent._parent.attachMovie("_bang","b" + _parent._parent.nr,6000 + _parent._parent.nr++,{_x:_X,_y:_Y,n:n});
         break;
      case 8:
         _root.s_btd.start();
         _parent._parent.attachMovie("_bang","b" + _parent._parent.nr,6000 + _parent._parent.nr++,{_x:_X,_y:_Y - 30,n:n,_xscale:120,_yscale:120});
         _root.vibra(7);
   }
   _name = "k" + n;
   _root.killed = _root.killed + 1;
}
gotoAndStop(t);
var Freeze = new Color(vik);
var freezeColor = {ra:100,rb:0,ga:100,gb:50,ba:100,bb:150,aa:100,ab:0};
var normalColor = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0,aa:100,ab:0};
prc = 0;
onEnterFrame = function()
{
   prc = Math.round(100 - nrg * 100 / nrg0);
   nrgs.gotoAndStop(prc);
   freeze(false);
};
stop();
