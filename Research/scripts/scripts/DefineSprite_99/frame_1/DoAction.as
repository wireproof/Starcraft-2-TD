function f5(t)
{
   if(t)
   {
      gotoAndStop(Number(t));
   }
   else if(_parent.n)
   {
      gotoAndStop(_parent.n);
   }
   else if(n)
   {
      gotoAndStop(n);
   }
   else
   {
      gotoAndStop(_name.substr(1,1));
   }
}
f5();
stop();
