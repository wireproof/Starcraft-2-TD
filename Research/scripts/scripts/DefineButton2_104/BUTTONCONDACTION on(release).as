on(release){
   if(m && _root.money >= _parent.radiusP[_parent["t" + m].t][_parent["t" + m].rad])
   {
      _parent["t" + m].cost += int(_parent.radiusP[_parent["t" + m].t][_parent["t" + m].rad] * 0.75);
      _parent.money -= _parent.radiusP[_parent["t" + m].t][_parent["t" + m].rad];
      _parent["t" + m].rad++;
      _parent["t" + m].r5();
      _parent["t" + m].ind.q3.gotoAndStop(_parent["t" + m].rad + 1);
      f5(m);
   }
}
