on(release){
   if(m)
   {
      _root.money += _parent["t" + m].cost;
      _parent["t" + m].w0();
      _parent["t" + m].removeMovieClip();
      _parent.rdss["r" + m].removeMovieClip();
      _parent.mask["mp" + m].removeMovieClip();
      _root.s_bc.start();
      _parent.show(0);
   }
}
