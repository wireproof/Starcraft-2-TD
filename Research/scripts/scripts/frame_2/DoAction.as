this._lockroot = true;
var theme = new Sound();
theme.attachSound("theme");
var s_exp = new Sound();
s_exp.attachSound("s_exp");
var s_mis = new Sound();
s_mis.attachSound("s_mis");
var s_md1 = new Sound();
s_md1.attachSound("s_md1");
var s_md2 = new Sound();
s_md2.attachSound("s_md2");
var s_md3 = new Sound();
s_md3.attachSound("s_md3");
var s_bnd = new Sound();
s_bnd.attachSound("s_bnd");
var s_btd = new Sound();
s_btd.attachSound("s_btd");
var s_hd = new Sound();
s_hd.attachSound("s_hd");
var s_tnd = new Sound();
s_tnd.attachSound("s_tnd");
var s_vd = new Sound();
s_vd.attachSound("s_vd");
var s_tp = new Sound();
s_tp.attachSound("s_tp");
var s_wp = new Sound();
s_wp.attachSound("s_wp");
var s_b = new Sound();
s_b.attachSound("s_b");
var s_bc = new Sound();
s_bc.attachSound("s_bc");
var s_bh = new Sound();
s_bh.attachSound("s_bh");
var s_up = new Sound();
s_up.attachSound("s_up");
var s_ed = new Sound();
s_ed.attachSound("s_ed");
var s_lt = new Sound();
s_lt.attachSound("s_lt");
var s_1b = new Sound();
s_1b.attachSound("s_1b");
var s_l3 = new Sound();
s_l3.attachSound("s_l3");
u = _url;
domain = 0;
domains = ["http://starcraft2.pro","http://www.starcraft2.pro","http://sc2armory.com","http://www.sc2armory.com","AMT2","MEE","mee","ru"];
i = 0;
while(i < domains.length)
{
   ar = u.split(domains[i]);
   if(ar.length == 2)
   {
      domain++;
      trace(">> " + domains[i]);
   }
   i++;
}
if(domain == 0)
{
   this.attachMovie("mm","mm",15001);
   mm.play();
}
else
{
   this.attachMovie("mm","mm",15001);
   mm.play();
}
stop();
