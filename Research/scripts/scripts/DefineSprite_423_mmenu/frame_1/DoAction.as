function f7(t)
{
   U._visible = false;
   P._visible = true;
   P.gotoAndStop(t + 1);
   Q.f5(t);
   nam = _parent.towers[t];
}
function f4()
{
   i = 1;
   while(i < 6)
   {
      this["c" + i] = _root.cost[i];
      i++;
   }
   U._visible = P._visible = false;
}
function f6(n)
{
   sll._y = 1000;
   U._visible = P._visible = true;
   P.gotoAndStop(1);
   t = _parent.ee["bot" + n].t;
   trace("bot =  " + n);
   _root.number_bot = n;
   timer = 500;
   if(getTimer() - qwer < timer and _root.target_par2 == _root.number_bot and clik_1 == 1)
   {
      clik_1 = 0;
      _root.hand_target2 = 0;
      _root.target_par = _root.number_bot;
      _root.hand_target2 = 1;
   }
   else
   {
      qwer = getTimer();
      clik_1 = 1;
   }
   _root.target_par2 = _root.number_bot;
   U.gotoAndStop(1);
   U.U.gotoAndStop(t + 10 * _parent.ee["bot" + n].cl);
   U.U.p = _parent.ee["bot" + n].nrg;
   P.p = _parent.ee["bot" + n].nrg0;
   switch(t)
   {
      case 2:
      case 3:
      case 5:
      case 6:
         P.skor = "NORMAL";
         break;
      case 7:
         P.skor = "FAST";
         break;
      case 4:
      case 8:
         P.skor = "SLOW";
   }
   switch(t)
   {
      case 2:
      case 7:
         P.bron = "LIGHT";
         break;
      case 4:
      case 8:
         P.bron = "HEAVY";
         break;
      case 3:
      case 5:
      case 6:
         P.bron = "MEDIUM";
   }
   onEnterFrame = function()
   {
      U.gotoAndStop(_parent.ee["bot" + n].prc);
      U.U.p = _parent.ee["bot" + n].nrg;
      if(_parent.ee["bot" + n].nrg <= 0)
      {
         _parent.show(0);
      }
   };
}
function f5(n)
{
   delete onEnterFrame;
   P.gotoAndStop(1);
   sll._y = -37;
   U._visible = P._visible = false;
   m = n;
   var _loc0_;
   if(m)
   {
      t = _parent["t" + n].t;
      Q.f5(t);
      nam = _parent.towers[t];
      n1 = "DAMAGE";
      n2 = "FIRE RATE";
      n3 = "RANGE";
      if(t == 4)
      {
         n1 = "SLOW RATIO";
      }
      if(t == 2 || t == 4)
      {
         n2 = "TARGETS";
      }
      v1 = _parent.damage[_parent["t" + n].t][_parent["t" + n].dam];
      v2 = _parent.rate[_parent["t" + n].t][_parent["t" + n].rat];
      v3 = _parent.radius[_parent["t" + n].t][_parent["t" + n].rad];
      switch(t)
      {
         case 1:
            v2 = int(240 / v2) / 10;
            break;
         case 2:
            v1 = Math.round(24 * v1);
            break;
         case 3:
            v1 *= 2;
            v2 = int(240 / v2) / 10;
            break;
         case 4:
            v1 = 100 - v1 * 100;
            v1 += "%";
            break;
         case 5:
            v2 = int(240 / v2) / 10;
      }
      p1 = _parent.damageP[_parent["t" + n].t][_parent["t" + n].dam];
      p2 = _parent.rateP[_parent["t" + n].t][_parent["t" + n].rat];
      p3 = _parent.radiusP[_parent["t" + n].t][_parent["t" + n].rad];
      cs = _parent["t" + n].cost;
      l1.f5(_parent["t" + n].dam);
      l2.f5(_parent["t" + n].rat);
      l3.f5(_parent["t" + n].rad);
   }
   else
   {
      cs = _loc0_ = "-";
      set(_temp_1,_loc0_);
      set(_temp_2,_loc0_);
      set(_temp_3,_loc0_);
      set(_temp_4,_loc0_);
      set(_temp_5,_loc0_);
      set(_temp_6,_loc0_);
      l1.f5(-1);
      l2.f5(-1);
      l3.f5(-1);
   }
}
var m;
f4();
