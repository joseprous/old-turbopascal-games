program Pacman;
uses
crt, graph;
label
Inicio,inicio2,menu1,menu2,1,2,3,4,5,6,7,fin,moverf,8;
const
 cuadrado: array[1..4] of PointType = ((X:225; Y:135),
   (X:225; Y:215), (X:355; Y:215),(X:355;Y:135));
   {rectangle(225,135,355,215); }
var
Nf:integer;
pm:integer;
P:text;
N:text;
D,M:integer;   {para initgraph}
x,y:integer; {posici¢n actual}
x1,y1:integer; {para direcci¢n}
rad,rad1,v:integer; {radio,para abrir y cerrar boca}
Xp,yp:integer;      {para poner los puntos}
di:string;        {readkey}
Pix:integer;       {getPixxel}
c1,cp,puntos:integer;       {contador,acumulador de puntos}
gp:array[1..10] of integer; {guardar puntos}
gn:array[1..10] of string[10];  {guardar nombres}
c2,v4:integer; {al agarrar los puntos de las esquinas}
Pif:integer;   {getpixel,color al borrar fantasma }
xf1,yf1:integer;  {posici¢n del fantasma, para mover fantasma}
V1:integer; {aleatorio para mover f}
v5:integer;
df:array[1..4]of integer; {Direcciones donde no se puede ir}
df2:array[1..4]of integer; {Direcciones donde se puede ir}
df1,v2:integer;  {(para cuando est n alineados,siguiente direcci¢n),contador de lugares donde se puede ir}
c3:integer;{para saber cuando salir}
f:array[1..5,1..10] of integer;
{1=xf
2=yf
3=pif
4=c3 para salir
5=cf
6=guard dir y
7=guard dir x
8=color
9=pos origianl x
10=pos original y}

c4:integer; {contador P/fantasmas}
s,s1:string;
v3:char;
nivel:integer;
vk:integer;

Procedure Pnivel;
begin
 c1:=0;
 setcolor(15);
 setlinestyle(0,1,3);
 rectangle(15,15,606,415);
 SetFillStyle(solidFill,1);
 fillPoly(SizeOf(cuadrado) div SizeOf(PointType), cuadrado);
 setcolor(1);
 line(280,135,290,135);
 setcolor(15);
 if nivel=1 then
 begin
  rectangle(204,105,406,115);
  rectangle(35,35,145,45);
  rectangle(35,385,45,345);
  line(15,65,105,65);
  line(125,65,195,65);
  rectangle(445,35,585,45);
  rectangle(575,35,585,125);
  rectangle(175,125,185,225);
  rectangle(435,385,585,395);
  rectangle(435,365,585,375);
  rectangle(165,265,175,365);
  rectangle(65,265,175,275);
  rectangle(135,295,145,415);
  rectangle(35,355,115,365);
  rectangle(15,295,85,305);
  rectangle(215,355,355,365);
  rectangle(215,355,225,395);
  rectangle(295,385,305,415);
  rectangle(165,325,285,335);
  rectangle(215,265,355,275);
  rectangle(345,265,355,365);
  rectangle(425,155,435,305);
  rectangle(475,215,605,225);
  rectangle(505,85,515,215);
  rectangle(425,255,555,265);
  rectangle(95,125,105,235);
  rectangle(45,185,155,195);
  rectangle(495,285,505,365);
  rectangle(375,295,435,305);
 end
 else if nivel=2 then
 begin
  line(215,115,275,115);
  line(295,115,365,115);
  rectangle(175,85,325,95);
  rectangle(285,15,295,65);
  rectangle(505,35,585,45);
  rectangle(385,65,505,75);
  rectangle(415,65,425,175);
  rectangle(465,115,605,125);
  rectangle(575,315,585,395);
  rectangle(545,305,555,415);
  rectangle(505,205,515,305);
  rectangle(535,245,605,255);
  rectangle(375,205,475,215);
  rectangle(105,255,285,265);
  rectangle(105,255,115,345);
  rectangle(185,175,195,265);
  rectangle(355,255,365,355);
  rectangle(255,305,365,315);
  rectangle(435,315,445,395);
  rectangle(435,365,495,375);
  rectangle(415,275,525,285);
  rectangle(35,385,105,395);
  rectangle(55,385,65,415);
  rectangle(15,335,65,345);
  rectangle(155,325,165,415);
  rectangle(205,365,305,375);
  rectangle(65,205,155,215);
  rectangle(65,205,75,305);
  rectangle(55,75,155,85);
  rectangle(105,75,115,155);
  rectangle(35,35,95,45);
  rectangle(185,35,195,105);
  rectangle(15,125,85,135);
 end
 else if nivel=3 then
 begin
  rectangle(195,205,205,305);
  rectangle(195,235,275,245);
  rectangle(105,295,205,305);
  rectangle(305,235,315,335);
  rectangle(235,275,315,285);
  rectangle(145,295,155,375);
  rectangle(185,325,285,335);
  rectangle(165,175,175,265);
  rectangle(165,175,205,185);
  rectangle(85,255,175,265);
  rectangle(375,175,385,275);
  rectangle(305,305,435,315);
  rectangle(375,245,475,255);
  rectangle(315,105,415,115);
  rectangle(405,105,415,205);
  rectangle(405,195,505,205);
  rectangle(495,195,505,295);
  rectangle(35,385,125,395);
  rectangle(105,295,115,325);
  rectangle(15,315,115,325);
  rectangle(45,195,115,205);
  rectangle(105,105,115,205);
  rectangle(15,35,65,45);
  rectangle(45,75,105,85);
  rectangle(45,75,55,165);
  rectangle(15,225,85,235);
  rectangle(255,365,405,375);
  rectangle(435,345,445,415);
  rectangle(535,305,605,315);
  rectangle(485,385,585,395);
  rectangle(575,355,585,395);
  rectangle(485,155,605,165);
  rectangle(575,35,585,105);
  rectangle(395,65,505,75);
  rectangle(135,75,295,85);
  rectangle(135,75,145,175);
  rectangle(225,15,235,55);
  rectangle(365,85,355,15);
 end;
 setlinestyle(0,0,1);

 while (xp < 605) and (yp < 400) do
 begin
  xp:=xp+10;
  setcolor(14);
  while (yp < 400) and (xp < 605) do
  begin
   yp:=yp+10;
   Pix:=getpixel(xp,yp);
   if (Pix<>15) and (Pix<>1) then
   begin
    putpixel(xp,yp,14);
    circle(xp,yp,1);
    c1:=c1+1;
   end;
  end;
  yp:=15;
 end;
 setcolor(2);
 setlinestyle(0,1,3);
 circle(25,25,2);
 circle(595,25,2);
 circle(595,405,2);
 circle(25,405,2);
 if nivel=1 then
 begin
  setcolor(0);
  rectangle(435,385,585,395);
  rectangle(435,365,585,375);
  setcolor(15);
  rectangle(435,365,585,395);
 end;
 setlinestyle(0,1,1);

 c1:=c1-1;
 setcolor(10);
 str(puntos,s1);
 s1:='Puntos: '+s1;
 outtextxy(40,425,'Puntos: ');
 str(nivel,s1);
 s1:='Nivel: '+s1;
 outtextxy(500,425,s1);
end;

procedure boca;
begin
 for Rad := 1 to 5 do
 begin
  setcolor(14);
  Circle(x,y, Rad);
  rectangle(x-(rad-1),y-(rad-1),x+(rad-1),y+(rad-1));
 end;
 if v=1 then
 begin
  v:=0;
  setcolor(0);
  for rad1:=-4 to 4 do
  begin
   if (Di='2') or (di='P') then line(x,y,x+rad1,y+rad);
   if (Di='6') or (di='M') or (di='') then line(x,y,x+rad,y+rad1);
   if (Di='8') or (di='H') then line(x,y,x-rad1,y-rad);
   if (Di='4') or (di='K') then line(x,y,x-rad,y-rad1);
  end;
 end
 else
 begin
  v:=1;
 end;
end;

begin
d:=detect;
initgraph(d,m,'');
Inicio:
clearviewport;
pm:=1;
menu1:
setcolor(14);
SetTextStyle(TriplexFont , HorizDir,8);
outtextxy(150,30,'PACMAN');
setcolor(14);
SetTextStyle(SansSerifFont , HorizDir,3);
outtextxy(200,150,'NUEVO JUEGO');
outtextxy(200,200,'MEJORES PUNTAJES');
outtextxy(200,250,'ACERCA DE');
outtextxy(200,300,'SALIR');
setcolor(2);
if pm=1 then outtextxy(200,150,'NUEVO JUEGO');
if pm=2 then outtextxy(200,200,'MEJORES PUNTAJES');
if pm=3 then outtextxy(200,250,'ACERCA DE');
if pm=4 then outtextxy(200,300,'SALIR');
repeat
until keypressed;
di:=readkey;
if (di='H') or (di='8') then
begin
if pm=1 then goto menu1;
pm:=pm-1;
end;
if (di='P') or (di='2') then
begin
if pm=4 then goto menu1;
pm:=pm+1;
end;
if di=chr(13) then goto menu2;
goto menu1;
menu2:
setcolor(0);
SetTextStyle(SansSerifFont , HorizDir,3);
outtextxy(200,150,'NUEVO JUEGO');
outtextxy(200,200,'MEJORES PUNTAJES');
outtextxy(200,250,'ACERCA DE');
outtextxy(200,300,'SALIR');
if pm=2 then
begin
 assign (p,'ppac1.txt');
 assign (N,'ppac2.txt');
 reset(p);
 reset(n);
 setcolor(14);
 v:=100;
 outtextxy(200,110,'MEJORES PUNTAJES');
 setcolor(15);
 SetTextStyle(smallFont , HorizDir,7);
 for v1:=1 to 5 do
 begin
 readln(p,gp[v1]);
 readln(n,gn[v1]);
 str(gp[v1],s);
 v:=v+50;
 outtextxy(350,v,s);
 outtextxy(220,v,gn[v1]);
 end;
 close(p);
 close(n);
gotoxy(1,1);
textcolor(0);
readln;
clearviewport;
goto menu1;
end;
if pm=3 then
begin
setcolor(14);
outtextxy(200,110,'ACERCA DE PACMAN');
setcolor(15);
SetTextStyle(smallFont , HorizDir,7);
outtextxy(235,150,'Pacman');
outtextxy(245,200,'2001');
outtextxy(160,250,'Creado por Jos‚ Prous.');
outtextxy(130,300,'Todos los derechos reservados.');
gotoxy(1,1);
textcolor(0);
readln;
clearviewport;
goto menu1;
end;
if pm=4 then
begin
closegraph;
exit;
end;
Nivel:=0;
nf:=3;
Puntos:=0;

inicio2:
settextstyle(defaultfont,HorizDir,1);
textcolor(7);
nivel:=nivel+1;
if nivel>3 then
begin
nf:=nf+1;
if nf>5 then nf:=5;
nivel:=1;
end;
cp:=0;
clearviewport;
v:=1;
di:='';
x1:=0;
y1:=0;
x:=285;
y:=225;
xp:=15;
yp:=15;
s:='0';
f[1,1]:=255;
f[1,9]:=255;

f[2,1]:=275;
f[2,9]:=275;

f[3,1]:=295;
f[3,9]:=295;

f[4,1]:=315;
f[4,9]:=315;

f[5,1]:=335;
f[5,9]:=335;

f[1,2]:=200;
f[2,2]:=200;
f[3,2]:=200;
f[4,2]:=200;
f[5,2]:=200;

f[1,10]:=200;
f[2,10]:=200;
f[3,10]:=200;
f[4,10]:=200;
f[5,10]:=200;

f[1,3]:=1;
f[2,3]:=1;
f[3,3]:=1;
f[4,3]:=1;
f[5,3]:=1;

f[1,4]:=random(50);
f[2,4]:=random(200);
f[3,4]:=random(300);
f[4,4]:=random(300);
f[5,4]:=random(300);

f[1,8]:=10;
f[2,8]:=3;
f[3,8]:=14;
f[4,8]:=9;
f[5,8]:=11;
Pnivel;

3:
repeat
  for c4:=1 to nf do
  begin
  f[c4,3]:=getpixel(f[c4,1],f[c4,2]-3);
  if f[c4,3]=1 then f[c4,5]:=1;
  if f[c4,3]=0 then f[c4,5]:=0;
  setcolor(f[c4,5]);
  Ellipse(f[c4,1],f[c4,2], 0, 180, 5, 10);
  line(f[c4,1]-5,f[c4,2],f[c4,1],f[c4,2]-1);
  line(f[c4,1],f[c4,2]-1,f[c4,1]+5,f[c4,2]);
  putpixel(f[c4,1]-2,f[c4,2]-5,f[c4,5]);
  putpixel(f[c4,1]+2,f[c4,2]-5,f[c4,5]);
  end;
 for Rad := 1 to 5 do
 begin
 setcolor(0);
 putpixel(x,y,0);
 Circle(x,y, Rad);
 rectangle(x-(rad),y-(rad),x+(rad),y+(rad));
 end;
 x:=x+x1;
 y:=y+y1;
 Pix:=getpixel(x,y);
 if (Pix=15) or (Pix=1) then
 begin
 x:=x-x1;
 y:=y-y1;
 end;
 if (pix=14) or (pix=2) then
 begin
 setcolor(0);
  str(puntos,s);
 outtextxy(100,425,s);
 setcolor(10);
 puntos:=puntos+1;
 cp:=cp+1;
 str(puntos,s);
 outtextxy(100,425,s);
 end;
 if pix=2 then v4:=1;
 if v4=1 then
 begin
      c2:=c2+1;
      if c2=100 then v4:=0;
 end
 else
 begin
      c2:=0;
 end;
 if cp=c1 then goto fin;
 boca;
 for c4:=1 to nf do
 begin
      if (f[c4,1]=x) and (f[c4,2]-5=y) then
         if v4=0 then goto fin
      else
      begin
           f[c4,1]:=f[c4,9];
           f[c4,2]:=f[c4,10];
           f[c4,4]:=random(200);
       end;
 end;
 goto moverf;
 4:
 for c4:=1 to nf do
 begin
      if (f[c4,1]=x) and (f[c4,2]-5=y) then
         if v4=0 then goto fin
      else
      begin
           f[c4,1]:=f[c4,9];
           f[c4,2]:=f[c4,10];
           f[c4,4]:=random(200);
      end;
 end;
delay(10000);
8:
until keypressed;
Di:=readkey;
if (Di='q') or (di='Q')then goto fin;
if (Di='p') {or (di='P')}then
begin
setcolor(11);
outtextxy(400,425,'Pausa');
repeat until keypressed;
setcolor(0);
outtextxy(400,425,'Pausa');
end;
if vk=1 then
begin
vk:=0;
goto 8;
end;

if (Di='8') or (di='H') then
begin
if di='H' then vk:=1;
X1:=0;
Y1:=-10;
end;


if (Di='2') or (di='P') then
begin
if di='P' then vk:=1;
X1:=0;
Y1:=10;
end;


if (Di='6') or (di='M') then
begin
if di='M' then vk:=1;
x1:=10;
Y1:=0;
end;


if (Di='4') or (di='K') then
begin
if di='K' then vk:=1;
X1:=-10;
Y1:=0;
end;
goto 3;
moverf:
randomize;
for c4:=1 to nf do
begin
f[c4,4]:=f[c4,4]-1;
if (f[c4,5]=1) and (f[c4,4]<1)then
begin
f[c4,4]:=0;
xf1:=0;
yf1:=0;
     if f[c4,1]>285 then
     begin
     xf1:=-10;
     goto 6
     end;
     if f[c4,1]<285 then
     begin
     xf1:=10;
     goto 6;
     end;
     if f[c4,2]-5>125 then
     begin
     yf1:=-10;
     goto 6;
     end;
     if f[c4,2]-5<285 then
     begin
     yf1:=10;
     goto 6;
     end;
end;
{}
v2:=0;
xf1:=0;
yf1:=0;
df[1]:=0;
df[2]:=0;
df[3]:=0;
df[4]:=0;
df2[1]:=0;
df2[2]:=0;
df2[3]:=0;
df2[4]:=0;
pif:=getpixel(f[c4,1],f[c4,2]+5);
if (pif=15) or (pif=1) then df[1]:=2;
pif:=getpixel(f[c4,1],f[c4,2]-15);
if(pif=15) or (pif=1) then df[2]:=8;
pif:=getpixel(f[c4,1]+10,f[c4,2]-5);
if (pif=15) or (pif=1) then df[3]:=6;
pif:=getpixel(f[c4,1]-10,f[c4,2]-5);
if (pif=15) or (pif=1) then df[4]:=4;

if f[c4,2]-5<y then
begin
if (df[3]=0) and (df[4]=0) and (df[1]=2) then df[2]:=8;
end;
if f[c4,2]-5>y then
begin
if (df[3]=0) and (df[4]=0) and (df[2]=8) then df[1]:=2;
end;
if f[c4,1]<x then
begin
if (df[1]=0) and (df[2]=0) and (df[3]=6) then df[4]:=4;
end;
if f[c4,1]>x then
begin
if (df[1]=0) and (df[2]=0) and (df[4]=4)then df[3]:=6;
end;

if (df[1]=2) or (df[2]=8) or (df[3]=6) or (df[4]=4) then
begin
for df1:=1 to 4 do
begin
     if df[df1]=0 then
     begin
     v2:=v2+1;
     df2[v2]:=df1;
     end;
end;
randomize;
for df1:=1 to v2 do
begin
     if (df2[df1]=1) and (x=f[c4,1]) and (f[c4,2]-5<y) then
     begin
     yf1:=10;
     f[c4,6]:=yf1;
     f[c4,7]:=xf1;
     goto 6;
     end;
     if (df2[df1]=2) and (x=f[c4,1]) and (f[c4,2]-5>y) then
     begin
     yf1:=-10;
     f[c4,6]:=yf1;
     f[c4,7]:=xf1;
     goto 6;
     end;
     if (df2[df1]=3) and (y=f[c4,2]-5) and (f[c4,1]<x) then
     begin
     xf1:=10;
     f[c4,6]:=yf1;
     f[c4,7]:=xf1;
     goto 6;
     end;
     if (df2[df1]=4) and (y=f[c4,2]-5) and (f[c4,1]>x) then
     begin
     xf1:=-10;
     f[c4,6]:=yf1;
     f[c4,7]:=xf1;
     goto 6;
     end;
end;
5:
df1:=random(v2)+1;
df1:=df2[df1];
if df1=2 then
begin
if not (df[1]=2) then
if f[c4,6]=10 then goto 5;
yf1:=-10;
end;
if df1=1 then
begin
if not (df[2]=8) then
if f[c4,6]=-10 then goto 5;
yf1:=10;
end;
if df1=3 then
begin
if not (df[4]=4)then
if f[c4,7]=-10 then goto 5;
xf1:=10;
end;
if df1=4 then
begin
if not (df[3]=6)then
if f[c4,7]=10 then goto 5;
xf1:=-10;
end;
f[c4,6]:=yf1;
f[c4,7]:=xf1;
goto 6;
end;

{} v1:=random(3);
   if V1=2 then
   begin
   if f[c4,2]-5=y then goto 1;
   2:
       xf1:=0;
       yf1:=0;
       if f[c4,2]-5 < y then
       begin
       yf1:=10;
       end
       else
       begin
       if f[c4,2]-5 > y then yf1:=-10;
       end;
  end
  else
  begin
  if f[c4,1]=x then goto 2;
  1:
       yf1:=0;
       xf1:=0;
       if f[c4,1] < x then
       begin
       xf1:=10;
       end
       else
       begin
       if f[c4,1] > x then xf1:=-10;
       end;
  end;
  6:
  f[c4,1]:=f[c4,1]+xf1;
  f[c4,2]:=f[c4,2]+yf1;
  pif:=getpixel(f[c4,1],f[c4,2]-5);
  if pif=15 then
  begin
  f[c4,1]:=f[c4,1]-xf1;
  f[c4,2]:=f[c4,2]-yf1;
  end;
  if v4=1 then
  begin
       if c2>80 then
       begin
            if v5=1 then
            begin
                 v5:=0;
                 setcolor(6)
            end
            else
            begin
                 v5:=1;
                 setcolor(f[c4,8]);
            end;
       end
       else
       setcolor(6);
  end
  else
  setcolor(f[c4,8]);

  Ellipse( f[c4,1],f[c4,2], 0, 180, 5, 10);
  line( f[c4,1]-5,f[c4,2], f[c4,1],f[c4,2]-1);
  line( f[c4,1],f[c4,2]-1, f[c4,1]+5,f[c4,2]);
  putpixel( f[c4,1]-2,f[c4,2]-5,f[c4,8]);
  putpixel( f[c4,1]+2,f[c4,2]-5,f[c4,8]);
  if (di='') and (c4=nf) then repeat boca; delay(7000); until keypressed;

end;
goto 4;

Fin:
{closegraph;}
setcolor(2);
settextstyle(defaultFont, HorizDir,4);
if c1=cp then
begin
puntos:=puntos+1;
goto inicio2;
end
else
outtextxy(100,70,'FIN DEL JUEGO');
settextstyle(defaultFont, HorizDir,3);
str(puntos,s);
s:='Hiciste '+s+' puntos';
outtextxy(100,150,s);
gotoxy(1,1);
textcolor(0);

{closegraph;
textcolor(7);
writeln(x,' ',y);
writeln('cp: ',cp,' puntos: ',puntos,' c1: ',c1);
readln;
{exit;}
repeat until readkey=chr(13);


 assign (p,'ppac1.txt');
 assign (N,'ppac2.txt');
 reset(p);
 reset(n);
 for v1:=1 to 5 do
 begin
 readln(p,gp[v1]);
 readln(n,gn[v1]);
 end;
 for v1:=1 to 5 do
 begin
 if puntos>gp[v1] then
 begin
 clearviewport;
 {closegraph;}
 textcolor(7);
 {writeln('NUEVO RECORD');}
 SetTextStyle(smallFont , HorizDir,6);
 outtextxy(1,1,'NUEVO RECORD');
 gp[v1+3]:=gp[v1+2];
 gp[v1+2]:=gp[v1+1];
 gp[v1+1]:=gp[v1];
 gp[v1]:=puntos;
 {write('Escriba su nombre: ');}
 outtextxy(1,28,'Escriba su nombre: ');
 gn[v1+3]:=gn[v1+2];
 gn[v1+2]:=gn[v1+1];
 gn[v1+1]:=gn[v1];
 gotoxy(25,3);
 readln(gn[v1]);
 goto 7;
 end;
 end;
 7:
 rewrite(p);
 rewrite(n);
 for v1:=1 to 5 do
 begin
 append(n);
 writeln(n,gn[v1]);
 close(n);
 append(p);
 writeln(p,gp[v1]);
 close(p);
 end;
puntos:=0;
goto inicio;
end.
