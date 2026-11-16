function bot_add(t, pos, way, sp, nrg)
{
   this.cl = 0;
   if(t > 10)
   {
      t -= 10;
      cl = 1;
   }
   if(t > 10)
   {
      t -= 10;
      cl++;
   }
   if(!nrg)
   {
      nrg = _root.nrg[t - 2 + cl * 8];
   }
   if(!sp)
   {
      sp = _root.spd[t - 2 + cl * 8];
   }
   ms = sp;
   this.km = _root.killmoney[t - 2 + cl * 8];
   pos = - pos;
   switch(way)
   {
      case 0:
         w = "0";
         break;
      case 1:
         w = "a0";
         break;
      case 2:
         w = "b0";
   }
   if(t == 2)
   {
      w += "m";
   }
   if(t == 8)
   {
      w = "btc";
      ee.attachMovie("bot" + cl,"bot" + n,n + 2000,{t:t,ms:ms,sp:sp,nrg:nrg,nrg0:nrg,n:n,killmoney:km,cl:cl,_x:-500,_y:-500});
   }
   else
   {
      ee.attachMovie("bot" + cl,"bot" + n,n,{t:t,ms:ms,sp:sp,nrg:nrg,nrg0:nrg,n:n,killmoney:km,cl:cl,_x:-500,_y:-500});
   }
   ee["bot" + n].gotoAndStop(2);
   _root.pos[_root.n] = pos;
   _root.tr[_root.n++] = w;
}
_root.stopAllSounds();
_root.theme.start();
_root.theme.onSoundComplete = function()
{
   _root.theme.start();
};
_root.theme.setVolume(80);
loss = 0;
score = 0;
killed = 0;
built = 0;
nl = 0;
tt = [];
gameOff = true;
startbuttunpressed = false;
this.attachMovie("mmenu","menu",14999,{_x:0,_y:800});
this.createEmptyMovieClip("ee",4996);
this.createEmptyMovieClip("rdss",4997);
ee.attachMovie("msk","msk",8999);
msk._visible = false;
attachMovie("drag","drag",4999,{_x:-100,_y:-100,_alpha:50});
mask.n = 1;
time = getTimer();
timer = timerx = 0;
setInterval(function()
{
   timerx++;
   timer += getTimer() - time - 300;
   timert = Math.round(timer / timerx) + "%";
   time = getTimer();
}
,300);
