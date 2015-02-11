program Gusanito;
uses
crt,graph;
label
inicio,Fin,1,2,3,4,5,6;
const
Nu=(62*46);
 cuadrado: array[1..4] of PointType = ((X:4; Y:4),
   (X:4; Y:476), (X:636; Y:476),(X:636;Y:4));
Var
f:text;
k:string; {para readkey del nivel}
Py,py1:integer; {posicion Y del cursor}
Pos: array[1..Nu,1..2] of integer;
Nc:integer; {numero de cola}
Na:integer; {numero actual de cola}
C1:integer; {contador}
v1:integer; {para comparar puntos}
v:integer;
Nj:string;{para nuevo juego}
D,M:integer; {para iniciar modo grafico}
X,Y:integer; {Posicion actual}
X1,Y1:integer; {para mover}
Mx,My:integer; {getmaxx y getmaxy}
Xm,Ym:integer;{posicion de manzana}
Di:string; {para direccion}
di1:integer;{para direccion}
P1:integer; {para getpixel}
puntos:integer; {acumulador de puntos}
Pv:integer;  {velocidad}
S:integer;

procedure Manz;
begin
Xm:=(random((Mx-14)div 10)*10)+10;
Ym:=(random((My-14) div 10)*10)+10;
p1:=getpixel(xm,ym);
if p1=2 then manz;
setcolor(4);
circle(Xm,Ym,5);
putpixel(Xm,Ym,4);
Nc:=Nc+1;
puntos:=puntos+pv;
if S=1 then
begin
sound(220);
delay(50);
nosound;
end;
end;

begin
closegraph;
S:=1;
Py:=2;
inicio:
clrscr;
writeln('Seleccione un nivel');
writeln(1);
writeln(2);
writeln(3);
writeln(4);
writeln(5);
gotoxy(1,py);
2:
repeat
until keypressed;
k:=readkey;
Py:=whereY;
if (k='H') or (k='8') then
begin
if (Py-1)<2 then goto 2;
gotoxy(1,Py-1);
end;
if (k='P') or (k='2') then
begin
if (Py+1)>6 then goto 2;
gotoxy(1,Py+1);
end;
if k=chr(13) then goto 1;
goto 2;
1:
Pv:=Py-1;
d:=detect;
initgraph(D,M,'');
SetFillStyle(emptyFill   , 2);
setcolor(15);
FillPoly(SizeOf(cuadrado) div SizeOf(PointType), cuadrado);
X:=300;
Y:=200;
X1:=10;
Y1:=0;
Mx:=getmaxx;
My:=getmaxy;
randomize;
Nc:=5;
Na:=1;
puntos:=-pv;
di1:=6;

setcolor(2);
circle(x,y,5);
putpixel(x,y,2);
pos[1,1]:=x;
Pos[1,2]:=y;
Na:=1;

manz;
3:
repeat
setcolor(4);
circle(Xm,Ym,5);
putpixel(Xm,Ym,4);
if Na=Nc then
begin
setcolor(0);
circle(Pos[1,1],Pos[1,2],5);
putpixel(Pos[1,1],Pos[1,2],0);
C1:=0;
repeat
c1:=c1+1;
pos[c1,1]:=pos[c1+1,1];
pos[c1,2]:=pos[c1+1,2];
until (pos[c1,1]=0);

end
else
begin
 Na:=Na+1;
end;
X:=X+X1;
Y:=Y+Y1;

p1:=getpixel(x,y);
If (X>(Mx-5)) or (Y>(My-5)) or (x<5) or (y<5) then goto Fin;
if p1=2 then goto fin;
setcolor(2);
circle(x,y,5);
putpixel(x,y,2);

pos[Na,1]:=x;
Pos[Na,2]:=y;

if p1=4 then Manz;
delay(7000 div Pv);
6:
until keypressed;
Di:=readkey;
if Di='q' then goto fin;

if v=1 then
begin
v:=0;
goto 6;
end;
if di='s' then s:=s*-1;

if (Di='8') or (Di='H') then
begin
if Di1=2 then
else
begin
if di='H' then v:=1;
di1:=8;
X1:=0;
Y1:=-10;
end;
end;

if (Di='2') or (Di='P') then
begin
if di1=8 then
else
begin
if di='P' then v:=1;
di1:=2;
X1:=0;
Y1:=10;
end;
end;

if (Di='6') or (Di='M') then
begin
if di1=4 then
else
begin
if di='M' then v:=1;
di1:=6;
X1:=10;
Y1:=0;
end;
end;

if (Di='4') or (Di='K') then
begin
if di1=6 then
else
begin
if di='K' then v:=1;
di1:=4;
X1:=-10;
Y1:=0;
end;
end;
goto 3;
Fin:
closegraph;
assign (f,'pgus.txt');
reset(f);
readln(f,V1);
if puntos>v1 then
begin
writeln('Perdiste');
write('NUEVO RECORD');
writeln(' Hiciste ',puntos,' puntos');
rewrite(f);
writeln(f,puntos);
close(f);
end
else
begin
writeln('Perdiste');
writeln('Hiciste ',puntos,' puntos');
end;
writeln('Desea jugar otra vez:');
writeln('Si');
writeln('No');
gotoxy(1,4);
5:
repeat
until keypressed;
k:=readkey;
Py1:=whereY;
if (k='H') or (k='8') then
begin
if (Py1-1)<4 then goto 5;
gotoxy(1,Py1-1);
end;
if (k='P') or (k='2') then
begin
if (Py1+1)>5 then goto 5;
gotoxy(1,Py1+1);
end;
if k=chr(13) then goto 4;
goto 5;
4:
if Py1=4 then goto inicio;
clrscr;
exit;
end.