on(release){
   if(m && _root.money >= _parent.rateP[_parent["t" + m].t][_parent["t" + m].rat])
   {
      _parent["t" + m].cost += int(_parent.rateP[_parent["t" + m].t][_parent["t" + m].rat] * 0.75);
      _parent.money -= _parent.rateP[_parent["t" + m].t][_parent["t" + m].rat];
      _parent["t" + m].rat++;
      _parent["t" + m].lod0 = _parent.rate[_parent["t" + m].t][_parent["t" + m].rat];
      if(_parent["t" + m].t == 2)
      {
         _parent["t" + m].w2();
      }
      else if(_parent["t" + m].t == 4)
      {
         _parent["t" + m].w4();
      }
      _parent["t" + m].ind.q2.gotoAndStop(_parent["t" + m].rat + 1);
      f5(m);
   }
}
