function gameOn()
{
   gameOff = false;
   onEnterFrame = function()
   {
      step++;
      if(step > 24)
      {
         step = 1;
      }
      i = 1;
      while(i < n)
      {
         if(ee["bot" + i])
         {
            pos[i] += ee["bot" + i].sp / 100;
            p = Math.floor(pos[i]);
            d = Math.round(pos[i] * 10 - p * 10) / 10;
            if(ee["bot" + i].t == 3)
            {
               ee["bot" + i].vik.gotoAndStop(r24[p]);
            }
            else if(ee["bot" + i].t == 2)
            {
               ee["bot" + i].vik.gotoAndStop(r24m[p]);
            }
            else if(ee["bot" + i].t == 8)
            {
               ee["bot" + i].vik.gotoAndStop(rbtc[p]);
               ee["bot" + i].fir.gotoAndStop(rbtc[p]);
               if(pos[i] > 63)
               {
                  s_up.start();
                  ee["bot" + i].removeMovieClip();
                  killed++;
                  kl--;
                  if(kl == 0)
                  {
                     gotoAndStop("next");
                  }
                  loss++;
                  if(loss >= 40)
                  {
                     this.attachMovie("end","mm",15002);
                  }
               }
            }
            else
            {
               ee["bot" + i].vik.gotoAndStop(r48[p]);
            }
            ee["bot" + i].vik.r.gotoAndStop(step);
            ee["bot" + i]._x = _root["x" + tr[i]][p] + (_root["x" + tr[i]][p + 1] - _root["x" + tr[i]][p]) * d;
            ee["bot" + i]._y = _root["y" + tr[i]][p] + (_root["y" + tr[i]][p + 1] - _root["y" + tr[i]][p]) * d;
            if(ee["bot" + i].sp !== ee["bot" + i].ms)
            {
               ee["bot" + i].sp = ee["bot" + i].ms;
            }
            if(pos[i] > 112)
            {
               s_up.start();
               ee["bot" + i].removeMovieClip();
               killed++;
               kl--;
               if(kl == 0)
               {
                  gotoAndStop("next");
               }
               loss++;
               if(loss >= 40)
               {
                  loss = 0;
                  this.attachMovie("end","mm",15002);
               }
            }
         }
         i++;
      }
      for(i in tt)
      {
         if(this["t" + tt[i]].lod > 0)
         {
            this["t" + tt[i]].lod--;
         }
         else
         {
            this["t" + tt[i]].lod = 0;
            if(this["t" + tt[i]].target)
            {
               this["t" + tt[i]].lod = this["t" + tt[i]].lod0;
               switch(this["t" + tt[i]].t)
               {
                  case 1:
                     attachMovie("sniper","r" + nr,9000 + nr,{dam:damage[this["t" + tt[i]].t][this["t" + tt[i]].dam],sp:0,_x:this["t" + tt[i]]._x,_y:this["t" + tt[i]]._y - 30,trg:this["t" + tt[i]].target,_rotation:(- Math.atan2(_root.ee["bot" + trg]._x - _X,_root.ee["bot" + trg]._y - _Y)) * 180 / 3.141592653589793,par:"t" + tt[i]});
                     this["r" + nr].r._y += 15;
                     trace(this["r" + nr].r._y);
                     nr++;
                     break;
                  case 3:
                     attachMovie("rocket","r" + nr,9000 + nr++,{dam:damage[this["t" + tt[i]].t][this["t" + tt[i]].dam],sp:0,_x:this["t" + tt[i]]._x + this["t" + tt[i]].tw.l._x - 49,_y:this["t" + tt[i]]._y + this["t" + tt[i]].tw.l._y - 57,trg:this["t" + tt[i]].target,_rotation:(- Math.atan2(_root.ee["bot" + trg]._x - _X,_root.ee["bot" + trg]._y - _Y)) * 180 / 3.141592653589793,secrok:"r" + (nr + 2),par:"t" + tt[i]});
                     attachMovie("rocket","r" + nr,9000 + nr++,{dam:damage[this["t" + tt[i]].t][this["t" + tt[i]].dam],sp:-5,_x:this["t" + tt[i]]._x + this["t" + tt[i]].tw.r._x - 49,_y:this["t" + tt[i]]._y + this["t" + tt[i]].tw.r._y - 57,trg:this["t" + tt[i]].target,_rotation:(- Math.atan2(_root.ee["bot" + trg]._x - _X,_root.ee["bot" + trg]._y - _Y)) * 180 / 3.141592653589793,par:"t" + tt[i]});
                     this["t" + tt[i]].target = 0;
                     break;
                  case 5:
                     this["t" + tt[i]].tw.l.play();
                     this["t" + tt[i]].tw.r.play();
                     attachMovie("bullet","r" + nr,9000 + nr++,{dam:damage[this["t" + tt[i]].t][this["t" + tt[i]].dam],trg:this["t" + tt[i]].target,tt:i});
               }
               if(nr == 7000)
               {
                  trace("\"nr\" value changed from 7000 to 6000");
                  nr = 6000;
               }
            }
         }
      }
      search();
   };
}
function search()
{
   lls = false;
   for(i in tt)
   {
      target = 0;
      if((this["t" + tt[i]].lod == 0 || this["t" + tt[i]].t == 2 || this["t" + tt[i]].t == 4) && this["t" + tt[i]].hitTest(ee))
      {
         nn = 1;
         if(this["t" + tt[i]].t == 2)
         {
            target = [];
            do
            {
               if(Math.sqrt((this["t" + tt[i]]._x - ee["bot" + nn]._x) * (this["t" + tt[i]]._x - ee["bot" + nn]._x) + (this["t" + tt[i]]._y - ee["bot" + nn]._y) * (this["t" + tt[i]]._y - ee["bot" + nn]._y)) - ee["bot" + nn].rr._width / 2 - this["t" + tt[i]].radius._width / 2 < 0)
               {
                  target.push(nn);
                  lls = true;
               }
               nn++;
            }
            while(target.length < this["t" + tt[i]].rat + 1 && nn <= n);
            this["t" + tt[i]].target = target;
            if(hand_target2 == 1 and Math.sqrt((this["t" + tt[i]]._x - ee["bot" + target_par]._x) * (this["t" + tt[i]]._x - ee["bot" + target_par]._x) + (this["t" + tt[i]]._y - ee["bot" + target_par]._y) * (this["t" + tt[i]]._y - ee["bot" + target_par]._y)) - ee["bot" + target_par].rr._width / 2 - this["t" + tt[i]].radius._width / 2 < 0)
            {
               if(target[0] > 0)
               {
                  this["t" + tt[i]].target[0] = target_par;
               }
            }
            t1 = 0;
            while(t1 < 6)
            {
               if(target[t1])
               {
                  this["l" + t1 + "t" + tt[i]].kill(target[t1]);
               }
               else
               {
                  this["l" + t1 + "t" + tt[i]].off();
               }
               t1++;
            }
         }
         else if(this["t" + tt[i]].t == 4)
         {
            nn = nb;
            target = [];
            do
            {
               if(Math.sqrt((this["t" + tt[i]]._x - ee["bot" + nn]._x) * (this["t" + tt[i]]._x - ee["bot" + nn]._x) + (this["t" + tt[i]]._y - ee["bot" + nn]._y) * (this["t" + tt[i]]._y - ee["bot" + nn]._y)) - ee["bot" + nn].rr._width / 2 - this["t" + tt[i]].radius._width / 2 < 0)
               {
                  target.push(nn);
               }
               nn--;
            }
            while(target.length < this["t" + tt[i]].rat + 1 && nn > 0);
            this["t" + tt[i]].target = target;
            t1 = 0;
            while(t1 < 6)
            {
               if(target[t1])
               {
                  this["l" + t1 + "t" + tt[i]].kill(target[t1]);
               }
               else
               {
                  this["l" + t1 + "t" + tt[i]].off();
               }
               t1++;
            }
         }
         else
         {
            target = 0;
            do
            {
               if(Math.sqrt((this["t" + tt[i]]._x - ee["bot" + nn]._x) * (this["t" + tt[i]]._x - ee["bot" + nn]._x) + (this["t" + tt[i]]._y - ee["bot" + nn]._y) * (this["t" + tt[i]]._y - ee["bot" + nn]._y)) - ee["bot" + nn].rr._width / 2 - this["t" + tt[i]].radius._width / 2 < 0)
               {
                  target = nn;
                  this["t" + tt[i]].target = nn;
                  if(hand_target2 == 1 and Math.sqrt((this["t" + tt[i]]._x - ee["bot" + target_par]._x) * (this["t" + tt[i]]._x - ee["bot" + target_par]._x) + (this["t" + tt[i]]._y - ee["bot" + target_par]._y) * (this["t" + tt[i]]._y - ee["bot" + target_par]._y)) - ee["bot" + target_par].rr._width / 2 - this["t" + tt[i]].radius._width / 2 < 0)
                  {
                     if(target > 0)
                     {
                        this["t" + tt[i]].target = target_par;
                        target = target_par;
                     }
                  }
               }
               else
               {
                  nn++;
               }
            }
            while(!target && nn <= n);
         }
         if(this["t" + tt[i]].t == 1 || this["t" + tt[i]].t == 3 || this["t" + tt[i]].t == 5)
         {
            rr = (- Math.atan2(ee["bot" + target]._x - this["t" + tt[i]]._x,ee["bot" + target]._y - this["t" + tt[i]]._y + 30)) * 180 / 3.141592653589793;
            rr = Math.round(rr / 3.75) + 25;
            if(rr < 0)
            {
               rr += 96;
            }
            if(rr > 128)
            {
               rr -= 96;
            }
            this["t" + tt[i]].tw.gotoAndStop(rr);
         }
      }
      else
      {
         this["t" + tt[i]].target = 0;
         this["l0t" + tt[i]].off();
      }
   }
}
function take(t)
{
   if(money >= cost[t])
   {
      trace(cost[t]);
      drag._x = _xmouse;
      drag._y = _ymouse;
      drag.t = t;
      drag.f5();
      drag.radius._xscale = drag.radius._yscale = radius[t][0];
      drag.startDrag("");
      drag.onEnterFrame = function()
      {
         if(mask.hitTest(_xmouse,_ymouse,true))
         {
            putt = 0;
         }
         else
         {
            putt = 1;
         }
         drag.gotoAndStop(2 - putt);
      };
   }
}
function put()
{
   if(putt)
   {
      drag._x = -100;
      drag._y = -100;
      drag.stopDrag("");
      nt = _ymouse + 10;
      while(this["t" + nt])
      {
         nt++;
      }
      money -= cost[drag.t];
      s_tp.start();
      attachMovie("tower","t" + nt,3000 + nt,{lod0:rate[drag.t][0],cost:int(cost[drag.t] * 0.75),_x:_xmouse,_y:nt,t:drag.t,n:nt,dam:0,rat:0,rad:0});
      rdss.attachMovie("radius","r" + nt,9000 + nt,{_x:_xmouse,_y:nt});
      tt.push(nt);
      mask.attachMovie("mp","mp" + nt,mask.n++,{_x:_xmouse,_y:_ymouse});
      show(nt);
      built++;
      delete drag.onEnterFrame;
   }
   else
   {
      s_wp.start();
   }
}
function vibra(k)
{
   clearInterval(vib);
   _root._x = 0;
   _root._y = 0;
   ki = 0;
   vib = setInterval(function()
   {
      _root._x = int(Math.random() * k - k / 2);
      _root._y = int(Math.random() * k - k / 2);
      if(ki > 1)
      {
         ki = 0;
         trace(k + "--");
         k--;
      }
      else
      {
         ki++;
         if(k == 0)
         {
            clearInterval(vib);
            _root._x = 0;
            _root._y = 0;
         }
      }
   }
   ,50);
}
function show(t)
{
   i = 0;
   while(i < tt.length)
   {
      rdss["r" + tt[i]]._alpha = 0;
      i++;
   }
   rdss["r" + t]._alpha = 100;
   menu.f5(t);
}
var p;
step = 1;
gameOff = false;
stop();
show(0);
kl = n - 1;
nb = n - 1;
nt = 0;
nr = 0;
speed = 10;
lls = 0;
ffs = 0;
bbs = 0;
if(startbuttunpressed)
{
   gameOn();
}
onMouseDown = function()
{
   if(_ymouse < 640)
   {
      rdss["r" + menu.m]._alpha = 0;
      show(0);
   }
};
var keyListener = new Object();
keyListener.onKeyDown = function()
{
   if(Key.getCode() == 27)
   {
      drag._x = -100;
      drag._y = -100;
      drag.stopDrag("");
   }
};
Key.addListener(keyListener);
