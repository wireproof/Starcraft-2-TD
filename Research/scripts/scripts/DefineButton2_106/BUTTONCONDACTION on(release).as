on(release){
   if(m && _root.money >= _parent.damageP[_parent["t" + m].t][_parent["t" + m].dam])
   {
      _parent["t" + m].cost += int(_parent.damageP[_parent["t" + m].t][_parent["t" + m].dam] * 0.75);
      _parent.money -= _parent.damageP[_parent["t" + m].t][_parent["t" + m].dam];
      _parent["t" + m].dam++;
      _parent["t" + m].ind.q1.gotoAndStop(_parent["t" + m].dam + 1);
      f5(m);
   }
}
