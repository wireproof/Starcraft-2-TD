function f5(n)
{
   i = 1;
   while(i <= 5)
   {
      if(1 + n >= i)
      {
         this["q" + i]._visible = false;
      }
      else
      {
         this["q" + i]._visible = true;
      }
      i++;
   }
   if(n == 4)
   {
      q6._visible = true;
   }
   else
   {
      q6._visible = false;
   }
}
