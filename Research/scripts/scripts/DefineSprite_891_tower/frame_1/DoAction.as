function f5(n)
{
   r5();
   if(t)
   {
      gotoAndStop(t);
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
function r5()
{
   _parent.rdss["r" + n]._xscale = _parent.rdss["r" + n]._yscale = radius._xscale = radius._yscale = _parent.radius[t][rad];
}
function w2()
{
   _parent.attachMovie("laser2","l" + rat + _name,8600 + _parent.nl++,{_x:_X,_y:_Y - 48,par:_name});
}
function w4()
{
   _parent.attachMovie("laser4","l" + rat + _name,8600 + _parent.nl++,{_x:_X,_y:_Y - 48,par:_name});
}
function w0()
{
   i = 0;
   while(i <= rat)
   {
      _parent["l" + i + _name].removeMovieClip();
      i++;
   }
}
f5();
attack = false;
target = 0;
lod = 0;
sik = 0;
stop();
if(t == 1 || t == 3 || t == 5)
{
   tw.stop();
}
else if(t == 2)
{
   w2();
}
else if(t == 4)
{
   w4();
}
