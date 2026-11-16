on(press){
   var si = setInterval(function()
   {
      if(p._x <= 35)
      {
         p._x += 5;
         p.corr();
      }
      else
      {
         p._x = 40;
         p.corr();
      }
   }
   ,50);
}
