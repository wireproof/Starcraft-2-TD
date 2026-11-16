on(release){
   _root.s_bc.start();
   switch(_name)
   {
      case "q5":
         trace("start");
         _parent._parent.play();
         if(_root.startbuttunpressed)
         {
            _root.gameOn();
         }
         break;
      case "q3":
         _parent.gotoAndStop(5);
         break;
      case "w3":
         trace("help");
         _parent.helps.play();
         break;
      case "q2":
         trace("settings");
         _parent._parent.n = 4;
         _parent._parent.play();
         break;
      case "w2":
         trace("settings");
         _parent.sett.play();
         break;
      case "s9":
         trace("Apply settings");
         _parent._parent.play();
         break;
      case "q9":
         trace("Apply settings");
         _parent._parent.n = 5;
         _parent._parent.play();
         trace("start");
         if(_root.startbuttunpressed)
         {
            _root.gameOn();
         }
         break;
      case "q4":
         trace("top 100");
         break;
      case "w1":
         trace("start");
         _parent.gotoAndPlay(62);
         break;
      case "w6":
         trace("easy");
         _root.diff = 0;
         _root.play();
         _parent.play();
         break;
      case "w7":
         trace("normal");
         _root.diff = 1;
         _root.play();
         _parent.play();
         break;
      case "w8":
         trace("hard");
         _root.diff = 2;
         _root.play();
         _parent.play();
   }
}
