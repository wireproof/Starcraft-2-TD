delete onEnterFrame;
clearInterval(sis);
delete drag.onEnterFrame;
drag.stopDrag("");
drag._x = -100;
drag._y = -100;
trace("end");
i = 0;
while(i <= 900)
{
   this["t" + i].removeMovieClip();
   rdss["r" + i].removeMovieClip();
   mask["mp" + i].removeMovieClip();
   i++;
}
i = 0;
while(i <= 100)
{
   ee["bot" + i].removeMovieClip();
   i++;
}
stop();
