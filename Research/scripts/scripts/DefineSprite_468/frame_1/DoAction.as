function corr()
{
   p._y = 60 + _X;
   vol = int((_X + 160) / 2);
   _root.theme.setVolume(vol);
}
_X = _root.theme.getVolume() * 2 - 160;
corr();
