LASTLEVEL = 45;
level++;
if(level > LASTLEVEL)
{
   this.attachMovie("end","mm",15002);
}
msk._visible = true;
lastlevel = 10;
pos = [];
tr = [];
p = [];
n = 1;
switch(level)
{
   case 0:
      bot_add(2,0,0,10);
      bot_add(2,2,1,10);
      bot_add(2,2,2,10);
      bot_add(12,4,0,10);
      bot_add(12,6,1,10);
      bot_add(12,6,2,10);
      bot_add(22,8,0,10);
      bot_add(22,10,1,10);
      bot_add(22,10,2,10);
      bot_add(3,12,1,10);
      bot_add(3,14,2,10);
      bot_add(13,16,1,10);
      bot_add(13,18,2,10);
      bot_add(23,20,1,10);
      bot_add(23,22,2,10);
      bot_add(7,26,0,10);
      bot_add(17,30,0,10);
      bot_add(27,34,0,10);
      bot_add(5,40,0,10);
      bot_add(15,46,0,10);
      bot_add(25,52,0,10);
      bot_add(4,56,0,10);
      bot_add(14,60,0,10);
      bot_add(24,64,0,10);
      bot_add(6,100,0,15);
      bot_add(16,106,0,15);
      bot_add(26,112,0,15);
      break;
   case 1:
      bot_add(2,0,1);
      bot_add(2,0,2);
      bot_add(2,2,0);
      bot_add(2,4,1);
      bot_add(2,4,2);
      next_unit = [2,0,0,0];
      kolvo_unit = [8,0,0,0];
      break;
   case 2:
      bot_add(2,0,1);
      bot_add(2,0,2);
      bot_add(2,2,0);
      bot_add(2,4,1);
      bot_add(2,4,2);
      bot_add(2,6,0);
      bot_add(2,8,1);
      bot_add(2,8,2);
      next_unit = [2,0,0,0];
      kolvo_unit = [14,0,0,0];
      break;
   case 3:
      bot_add(2,0,1);
      bot_add(2,0,2);
      bot_add(2,2,0);
      bot_add(2,4,1);
      bot_add(2,4,2);
      bot_add(2,6,0);
      bot_add(2,8,1);
      bot_add(2,8,2);
      bot_add(2,10,0);
      bot_add(2,12,1);
      bot_add(2,12,2);
      bot_add(2,14,0);
      bot_add(2,16,1);
      bot_add(2,16,2);
      next_unit = [2,0,0,0];
      kolvo_unit = [24,0,0,0];
      break;
   case 4:
      bot_add(2,-2,0);
      bot_add(2,0,1);
      bot_add(2,0,2);
      bot_add(2,2,0);
      bot_add(2,4,1);
      bot_add(2,4,2);
      bot_add(2,6,0);
      bot_add(2,8,1);
      bot_add(2,8,2);
      bot_add(2,10,0);
      bot_add(2,12,1);
      bot_add(2,12,2);
      bot_add(2,14,0);
      bot_add(2,16,1);
      bot_add(2,16,2);
      bot_add(2,18,0);
      bot_add(2,20,1);
      bot_add(2,20,2);
      bot_add(2,22,0);
      bot_add(2,24,1);
      bot_add(2,24,2);
      bot_add(2,26,0);
      bot_add(2,28,1);
      bot_add(2,28,2);
      next_unit = [3,2,0,0];
      kolvo_unit = [6,10,0,0];
      break;
   case 5:
      bot_add(3,0,0);
      bot_add(3,3,1);
      bot_add(3,3,2);
      bot_add(3,6,0);
      bot_add(3,9,1);
      bot_add(3,9,2);
      bot_add(2,8,1);
      bot_add(2,8,2);
      bot_add(2,10,0);
      bot_add(2,12,1);
      bot_add(2,12,2);
      bot_add(2,14,1);
      bot_add(2,14,2);
      bot_add(2,16,0);
      bot_add(2,18,1);
      bot_add(2,18,2);
      next_unit = [7,3,0,0];
      kolvo_unit = [6,6,0,0];
      break;
   case 6:
      bot_add(7,0,1);
      bot_add(7,4,2);
      bot_add(7,8,1);
      bot_add(7,12,2);
      bot_add(7,16,1);
      bot_add(7,20,2);
      bot_add(3,20,1);
      bot_add(3,22,2);
      bot_add(3,24,1);
      bot_add(3,26,2);
      bot_add(3,28,1);
      bot_add(3,30,2);
      next_unit = [3,2,0,0];
      kolvo_unit = [8,61,0,0];
      break;
   case 7:
      bot_add(3,0,1);
      bot_add(3,2,2);
      bot_add(3,4,1);
      bot_add(3,6,2);
      bot_add(3,8,1);
      bot_add(3,10,2);
      bot_add(3,12,1);
      bot_add(3,14,2);
      bot_add(2,12,0);
      i = 0;
      while(i < 40)
      {
         bot_add(2,14 + i * 2,0);
         bot_add(2,16 + i * 2,1);
         bot_add(2,16 + i * 2,2);
         i += 2;
      }
      next_unit = [7,0,0,0];
      kolvo_unit = [16,0,0,0];
      break;
   case 8:
      i = 0;
      while(i < 8)
      {
         bot_add(7,i * 8,1);
         bot_add(7,i * 8 + 4,2);
         i++;
      }
      next_unit = [3,2,0,0];
      kolvo_unit = [14,40,0,0];
      break;
   case 9:
      bot_add(3,0,1);
      bot_add(3,2,2);
      bot_add(3,4,1);
      bot_add(3,6,2);
      bot_add(3,8,1);
      bot_add(3,10,2);
      bot_add(3,12,1);
      bot_add(3,14,2);
      bot_add(3,16,1);
      bot_add(3,18,2);
      bot_add(3,20,1);
      bot_add(3,22,2);
      bot_add(3,24,1);
      bot_add(3,26,2);
      bot_add(2,26,0);
      i = 0;
      while(i < 26)
      {
         bot_add(2,28 + i * 2,0);
         bot_add(2,30 + i * 2,1);
         bot_add(2,30 + i * 2,2);
         i += 2;
      }
      next_unit = [3,0,0,0];
      kolvo_unit = [22,0,0,0];
      break;
   case 10:
      i = 0;
      while(i < 22)
      {
         bot_add(3,i * 2,1);
         bot_add(3,i * 2 + 2,2);
         i += 2;
      }
      next_unit = [7,5,0,0];
      kolvo_unit = [2,6,0,0];
      break;
   case 11:
      bot_add(7,0,0);
      bot_add(7,6,0);
      bot_add(5,8,0);
      bot_add(5,14,0);
      bot_add(5,20,0);
      bot_add(5,26,0);
      bot_add(5,32,0);
      bot_add(5,38,0);
      next_unit = [6,0,0,0];
      kolvo_unit = [8,0,0,0];
      break;
   case 12:
      i = 0;
      while(i < 8)
      {
         bot_add(6,i * 6,0);
         i++;
      }
      next_unit = [6,3,0,0];
      kolvo_unit = [3,20,0,0];
      break;
   case 13:
      bot_add(6,0,0);
      bot_add(6,6,0);
      bot_add(6,12,0);
      i = 0;
      while(i < 20)
      {
         bot_add(3,10 + i * 2,1);
         bot_add(3,i * 2 + 12,2);
         i += 2;
      }
      next_unit = [5,0,0,0];
      kolvo_unit = [9,0,0,0];
      break;
   case 14:
      i = 0;
      while(i < 9)
      {
         bot_add(5,i * 6,0);
         i++;
      }
      next_unit = [8,0,0,0];
      kolvo_unit = [3,0,0,0];
      break;
   case 15:
      bot_add(8,0,0);
      bot_add(8,12,0);
      bot_add(8,24,0);
      next_unit = [4,0,0,0];
      kolvo_unit = [4,0,0,0];
      break;
   case 16:
      bot_add(4,0,0);
      bot_add(4,6,0);
      bot_add(4,12,0);
      bot_add(4,18,0);
      next_unit = [12,0,0,0];
      kolvo_unit = [36,0,0,0];
      break;
   case 17:
      i = 0;
      while(i < 24)
      {
         bot_add(12,2 + i * 2,0);
         bot_add(12,4 + i * 2,1);
         bot_add(12,4 + i * 2,2);
         i += 2;
      }
      next_unit = [13,5,0,0];
      kolvo_unit = [8,9,0,0];
      break;
   case 18:
      i = 0;
      while(i < 4)
      {
         bot_add(13,i * 4,1);
         bot_add(13,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 9)
      {
         bot_add(5,17 + i * 6,0);
         i++;
      }
      next_unit = [13,0,0,0];
      kolvo_unit = [21,0,0,0];
      break;
   case 19:
      bot_add(13,0,0);
      i = 0;
      while(i < 5)
      {
         bot_add(13,i * 12 + 3,1);
         bot_add(13,i * 12 + 6,0);
         bot_add(13,i * 12 + 9,2);
         bot_add(13,i * 12 + 12,0);
         i++;
      }
      next_unit = [17,0,0,0];
      kolvo_unit = [13,0,0,0];
      break;
   case 20:
      bot_add(17,0,1);
      i = 0;
      while(i < 6)
      {
         bot_add(17,i * 8 + 4,2);
         bot_add(17,i * 8 + 8,1);
         i++;
      }
      next_unit = [15,12,0,0];
      kolvo_unit = [8,30,0,0];
      break;
   case 21:
      i = 0;
      while(i < 8)
      {
         bot_add(15,i * 6,0);
         i++;
      }
      i = 0;
      while(i < 20)
      {
         bot_add(12,42 + i * 2,0);
         bot_add(12,44 + i * 2,1);
         bot_add(12,44 + i * 2,2);
         i += 2;
      }
      next_unit = [16,0,0,0];
      kolvo_unit = [11,0,0,0];
      break;
   case 22:
      i = 0;
      while(i < 11)
      {
         bot_add(16,i * 6,0);
         i++;
      }
      next_unit = [13,15,0,0];
      kolvo_unit = [30,9,0,0];
      break;
   case 23:
      i = 0;
      while(i < 15)
      {
         bot_add(13,i * 4,1);
         bot_add(13,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 9)
      {
         bot_add(15,60 + i * 6,0);
         i++;
      }
      next_unit = [17,16,0,0];
      kolvo_unit = [12,10,0,0];
      break;
   case 24:
      i = 0;
      while(i < 6)
      {
         bot_add(17,i * 8,2);
         bot_add(17,i * 8 + 4,1);
         i++;
      }
      i = 0;
      while(i < 10)
      {
         bot_add(16,i * 6,0);
         i++;
      }
      next_unit = [13,12,16,0];
      kolvo_unit = [10,28,13,0];
      break;
   case 25:
      i = 0;
      while(i < 5)
      {
         bot_add(13,i * 4,1);
         bot_add(13,i * 4 + 2,2);
         i++;
      }
      bot_add(12,6 + i * 4,0);
      i = 0;
      while(i < 9)
      {
         bot_add(12,18 + i * 4,0);
         bot_add(12,20 + i * 4,1);
         bot_add(12,20 + i * 4,2);
         i++;
      }
      i = 0;
      while(i < 13)
      {
         bot_add(16,15 + i * 6,0);
         i++;
      }
      next_unit = [12,17,16,0];
      kolvo_unit = [30,12,10,0];
      break;
   case 26:
      i = 0;
      while(i < 10)
      {
         bot_add(12,12 + i * 4,0);
         bot_add(12,14 + i * 4,1);
         bot_add(12,14 + i * 4,2);
         i++;
      }
      i = 0;
      while(i < 6)
      {
         bot_add(17,i * 8,2);
         bot_add(17,i * 8 + 4,1);
         i++;
      }
      i = 0;
      while(i < 10)
      {
         bot_add(16,i * 6,0);
         i++;
      }
      next_unit = [13,16,0,0];
      kolvo_unit = [24,15,0,0];
      break;
   case 27:
      i = 0;
      while(i < 12)
      {
         bot_add(13,i * 4,1);
         bot_add(13,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 15)
      {
         bot_add(16,45 + i * 6,0);
         i++;
      }
      next_unit = [17,18,0,0];
      kolvo_unit = [20,4,0,0];
      break;
   case 28:
      i = 0;
      while(i < 10)
      {
         bot_add(17,i * 8,2);
         bot_add(17,i * 8 + 4,1);
         i++;
      }
      bot_add(18,0,0);
      bot_add(18,12,0);
      bot_add(18,24,0);
      bot_add(18,36,0);
      next_unit = [14,0,0,0];
      kolvo_unit = [10,0,0,0];
      break;
   case 29:
      i = 0;
      while(i < 10)
      {
         bot_add(14,i * 5,0);
         i++;
      }
      next_unit = [18,0,0,0];
      kolvo_unit = [10,0,0,0];
      break;
   case 30:
      i = 0;
      while(i < 10)
      {
         bot_add(18,i * 12,0);
         i++;
      }
      next_unit = [18,14,0,0];
      kolvo_unit = [4,9,0,0];
      break;
   case 31:
      i = 0;
      while(i < 4)
      {
         bot_add(18,i * 12,0);
         i++;
      }
      i = 0;
      while(i < 9)
      {
         bot_add(14,i * 5,0);
         i++;
      }
      next_unit = [23,22,0,0];
      kolvo_unit = [20,30,0,0];
      break;
   case 32:
      i = 0;
      while(i < 10)
      {
         bot_add(23,i * 4,1);
         bot_add(23,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 20)
      {
         bot_add(22,30 + i * 2,0);
         bot_add(22,32 + i * 2,1);
         bot_add(22,32 + i * 2,2);
         i += 2;
      }
      next_unit = [27,23,0,0];
      kolvo_unit = [30,16,0,0];
      break;
   case 33:
      i = 0;
      while(i < 30)
      {
         bot_add(27,i * 4,0);
         i++;
      }
      i = 0;
      while(i < 8)
      {
         bot_add(23,52 + i * 4,1);
         bot_add(23,52 + i * 4 + 2,2);
         i++;
      }
      next_unit = [23,0,0,0];
      kolvo_unit = [50,0,0,0];
      break;
   case 34:
      i = 0;
      while(i < 25)
      {
         bot_add(23,i * 4,1);
         bot_add(23,i * 4 + 2,2);
         i++;
      }
      next_unit = [22,0,0,0];
      kolvo_unit = [99,0,0,0];
      break;
   case 35:
      i = 0;
      while(i < 33)
      {
         bot_add(22,2 + i * 4,0);
         bot_add(22,4 + i * 4,1);
         bot_add(22,4 + i * 4,2);
         i++;
      }
      next_unit = [27,0,0,0];
      kolvo_unit = [70,0,0,0];
      break;
   case 36:
      i = 0;
      while(i < 35)
      {
         bot_add(27,i * 8,1);
         bot_add(27,i * 8 + 4,2);
         i++;
      }
      next_unit = [23,26,0,0];
      kolvo_unit = [30,18,0,0];
      break;
   case 37:
      i = 0;
      while(i < 15)
      {
         bot_add(23,i * 4,1);
         bot_add(23,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 18)
      {
         bot_add(26,100 + i * 6,0);
         100 + i++;
      }
      next_unit = [22,26,0,0];
      kolvo_unit = [60,19,0,0];
      break;
   case 38:
      i = 0;
      while(i < 20)
      {
         bot_add(22,2 + i * 4,0);
         bot_add(22,4 + i * 4,1);
         bot_add(22,4 + i * 4,2);
         i++;
      }
      i = 0;
      while(i < 19)
      {
         bot_add(26,80 + i * 6,0);
         80 + i++;
      }
      next_unit = [25,0,0,0];
      kolvo_unit = [24,0,0,0];
      break;
   case 39:
      i = 0;
      while(i < 24)
      {
         bot_add(25,i * 6,0);
         i++;
      }
      next_unit = [27,28,23,0];
      kolvo_unit = [40,1,80,0];
      break;
   case 40:
      i = 0;
      while(i < 20)
      {
         bot_add(27,i * 8,1);
         bot_add(27,i * 8 + 4,2);
         i++;
      }
      bot_add(28,0,0);
      i = 0;
      while(i < 40)
      {
         bot_add(23,70 + i * 4,1);
         bot_add(23,70 + i * 4 + 2,2);
         i++;
      }
      next_unit = [23,26,28,0];
      kolvo_unit = [20,20,5,0];
      break;
   case 41:
      i = 0;
      while(i < 10)
      {
         bot_add(23,i * 4,1);
         bot_add(23,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 20)
      {
         bot_add(26,i * 6,0);
         i++;
      }
      i = 0;
      while(i < 5)
      {
         bot_add(28,26 + i * 12,0);
         i++;
      }
      next_unit = [23,25,24,0];
      kolvo_unit = [30,10,6,0];
      break;
   case 42:
      i = 0;
      while(i < 15)
      {
         bot_add(23,i * 4,1);
         bot_add(23,i * 4 + 2,2);
         i++;
      }
      i = 0;
      while(i < 10)
      {
         bot_add(25,40 + i * 6,0);
         i++;
      }
      i = 0;
      while(i < 6)
      {
         bot_add(24,80 + i * 6,0);
         i++;
      }
      next_unit = [25,26,0,0];
      kolvo_unit = [20,20,0,0];
      break;
   case 43:
      i = 0;
      while(i < 20)
      {
         bot_add(25,i * 6,0);
         i++;
      }
      i = 0;
      while(i < 20)
      {
         bot_add(26,20 + i * 6,0);
         i++;
      }
      next_unit = [28,0,0,0];
      kolvo_unit = [25,0,0,0];
      break;
   case 44:
      i = 0;
      while(i < 25)
      {
         bot_add(28,i * 12,0);
         i++;
      }
      next_unit = [24,0,0,0];
      kolvo_unit = [30,0,0,0];
      break;
   case 45:
      i = 0;
      while(i < 30)
      {
         bot_add(24,i * 6,0);
         i++;
      }
      next_unit = [0,0,0,0];
      kolvo_unit = [0,0,0,0];
}
