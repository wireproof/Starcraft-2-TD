on(press){
   var si = setInterval(function()
   {
      if(p._x >= -155)
      {
         p._x -= 5;
         p.corr();
      }
      else
      {
         p._x = -160;
         p.corr();
      }
   }
   ,50);
}
