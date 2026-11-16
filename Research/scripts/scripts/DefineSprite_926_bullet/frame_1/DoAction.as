_root.s_b.start();
_X = _root.ee["bot" + trg]._x;
_Y = _root.ee["bot" + trg]._y;
_root.ee["bot" + trg].nrg -= int(dam * _root.armor[2][_root.ee["bot" + trg].t - 2]);
if(_root.ee["bot" + trg].nrg <= 0)
{
   _root.ee["bot" + trg].kill();
}
bull = true;
