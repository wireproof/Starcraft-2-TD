kadr1 = "u" + _root.next_unit[0];
kadr2 = "u" + _root.next_unit[1];
kadr3 = "u" + _root.next_unit[2];
kadr4 = "u" + _root.next_unit[3];
tu1 = _root.next_unit[0];
tu2 = _root.next_unit[1];
tu3 = _root.next_unit[2];
tu4 = _root.next_unit[3];
next_unit1_mc.gotoAndStop(kadr1);
next_unit2_mc.gotoAndStop(kadr2);
next_unit3_mc.gotoAndStop(kadr3);
next_unit4_mc.gotoAndStop(kadr4);
if(_root.kolvo_unit[0] !== 0)
{
   next_kol1_txt.text = _root.kolvo_unit[0];
   this.cl = 0;
   if(tu1 > 10)
   {
      tu1 -= 10;
      cl = 1;
   }
   if(tu1 > 10)
   {
      tu1 -= 10;
      cl++;
   }
   next_life1_txt.text = _root.nrg[tu1 - 2 + cl * 8];
}
if(_root.kolvo_unit[1] !== 0)
{
   next_kol2_txt.text = _root.kolvo_unit[1];
   this.cl = 0;
   if(tu2 > 10)
   {
      tu2 -= 10;
      cl = 1;
   }
   if(tu2 > 10)
   {
      tu2 -= 10;
      cl++;
   }
   next_life2_txt.text = _root.nrg[tu2 - 2 + cl * 8];
}
if(_root.kolvo_unit[2] !== 0)
{
   next_kol3_txt.text = _root.kolvo_unit[2];
   this.cl = 0;
   if(tu3 > 10)
   {
      tu3 -= 10;
      cl = 1;
   }
   if(tu3 > 10)
   {
      tu3 -= 10;
      cl++;
   }
   next_life3_txt.text = _root.nrg[tu3 - 2 + cl * 8];
}
if(_root.kolvo_unit[3] !== 0)
{
   next_kol4_txt.text = _root.kolvo_unit[3];
   this.cl = 0;
   if(tu4 > 10)
   {
      tu4 -= 10;
      cl = 1;
   }
   if(tu4 > 10)
   {
      tu4 -= 10;
      cl++;
   }
   next_life4_txt.text = _root.nrg[tu4 - 2 + cl * 8];
}
