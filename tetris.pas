uses crt,graph;
label 1,2,3;
var
d,m,i,j,puntos,vel,gvel,c1:integer;
p:array[1..4,1..2]of integer;
pix:array[1..4] of byte;
c,b,dir,v:byte;
k:char;
P1: Pointer;
Size: Word;
s:string;
procedure empezar;
begin
k:=' ';
vel:=vel-5;
dir:=1;
c:=random(15)+1;
v:=random(7);
p[2,1]:=360;
p[2,2]:=100;
p[3,1]:=360;
p[3,2]:=112;
p[4,1]:=360;
p[4,2]:=124;
if v=0 then
begin
p[1,1]:=360;
p[1,2]:=88;
end;
if v=1 then
begin
p[1,1]:=372;
p[1,2]:=100;
end;
if v=2 then
begin
p[1,1]:=372;
p[1,2]:=124;
end;
if v=3 then
begin
p[1,1]:=372;
p[1,2]:=112;
end;
if v=4 then
begin
p[1,1]:=372;
p[1,2]:=100;
p[4,1]:=372;
p[4,2]:=112;
end;

if v=5 then
begin
p[1,1]:=372;
p[1,2]:=112;
p[2,1]:=372;
end;

if v=6 then
begin
p[1,1]:=372;
p[1,2]:=112;
p[4,1]:=372;
end;

 for i:=1 to 4 do pix[i]:=getpixel(p[i,1],p[i,2]);

 if ((pix[1]>0) or (pix[2]>0) or(pix[3]>0) or(pix[4]>0)) then
 begin
  outtext('Perdiste ');
  str(puntos,s);
  outtext(' Hiciste '+s+' Puntos');

  readln;
  closegraph;
  halt;
 end;
end;

procedure borrar;
begin
setfillstyle(1,0);
for i:=1 to 4 do bar(p[i,1],p[i,2],p[i,1]+10,p[i,2]+10);
end;

procedure dibujar;
begin
setfillstyle(1,c);
for i:=1 to 4 do bar(p[i,1],p[i,2],p[i,1]+10,p[i,2]+10);
end;

procedure girar;
var
a:array[1..4,1..2]of integer;
d2:byte;
begin
borrar;
for i:=1 to 4 do
 for j:=1 to 2 do a[i,j]:=p[i,j];
d2:=dir;
  if ((dir=1) and ((k='s') or (k='5') or (v=5) or (v=6))) or ((dir=3) and (k='d'))then
  begin
   p[2,1]:=p[3,1]-12;
   p[2,2]:=p[3,2];
   p[4,1]:=p[3,1]+12;
   p[4,2]:=p[3,2];
   if v=0 then
   begin
    p[1,1]:=p[2,1]-12;
    p[1,2]:=p[3,2];
   end;
   if v=1 then
   begin
    p[1,1]:=p[3,1]-12;
    p[1,2]:=p[3,2]-12;
   end;
   if v=2 then
   begin
    p[1,1]:=p[3,1]+12;
    p[1,2]:=p[3,2]-12;
   end;
   if v=3 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[3,2]-12;
   end;
   dir:=2;
   if v=5 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[3,2]-12;
    p[2,1]:=p[3,1]-12;
    p[2,2]:=p[3,2]-12;
    dir:=2;
   end;
   if v=6 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[3,2]-12;
    p[2,1]:=p[3,1]+12;
    p[2,2]:=p[3,2]-12;
    p[4,1]:=p[3,1]-12;
    p[4,2]:=p[3,2];
    dir:=2;
   end;
  end
  else
  if ((dir=2) and ((k='s') or (k='5')or (v=5) or (v=6))) or ((dir=4) and (k='d')) then
  begin
   p[2,1]:=p[3,1];
   p[2,2]:=p[3,2]-12;
   p[4,1]:=p[3,1];
   p[4,2]:=p[3,2]+12;
   if v=0 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[4,2]+12;
   end;
   if v=1 then
   begin
    p[1,1]:=p[3,1]-12;
    p[1,2]:=p[4,2];
   end;
   if v=2 then
   begin
    p[1,1]:=p[3,1]-12;
    p[1,2]:=p[3,2]-12;
   end;
   if v=3 then
   begin
    p[1,1]:=p[3,1]-12;
    p[1,2]:=p[3,2];
   end;
   dir:=3;
   if v=5 then
   begin
    p[1,1]:=p[3,1]+12;
    p[1,2]:=p[3,2];
    p[2,1]:=p[3,1]+12;
    p[2,2]:=p[3,2]-12;
    dir:=1;
   end;
   if v=6 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[3,2]-12;
    p[2,1]:=p[3,1]+12;
    p[2,2]:=p[3,2];
    p[4,1]:=p[3,1]+12;
    p[4,2]:=p[3,2]+12;
    dir:=1;
   end;
  end
  else
  if ((dir=3) and ((k='s')or (k='5'))) or ((dir=1) and (k='d')) then
  begin
   p[2,1]:=p[3,1]-12;
   p[2,2]:=p[3,2];
   p[4,1]:=p[3,1]+12;
   p[4,2]:=p[3,2];
   if v=0 then
   begin
    p[1,1]:=p[4,1]+12;
    p[1,2]:=p[3,2];
   end;
   if v=1 then
   begin
    p[1,1]:=p[4,1];
    p[1,2]:=p[3,2]+12;
   end;
   if v=2 then
   begin
    p[1,1]:=p[2,1];
    p[1,2]:=p[3,2]+12;
   end;
   if v=3 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[3,2]+12;
   end;
   dir:=4;
  end
  else
  if ((dir=4) and ((k='s')or (k='5'))) or ((dir=2) and (k='d')) then
  begin
   p[2,1]:=p[3,1];
   p[2,2]:=p[3,2]-12;
   p[4,1]:=p[3,1];
   p[4,2]:=p[3,2]+12;
   dir:=1;
   if v=0 then
   begin
    p[1,1]:=p[3,1];
    p[1,2]:=p[2,2]-12;
   end;
   if v=1 then
   begin
    p[1,1]:=p[2,1]+12;
    p[1,2]:=p[3,2]-12;
   end;
   if v=2 then
   begin
    p[1,1]:=p[2,1]+12;
    p[1,2]:=p[3,2]+12;
   end;
   if v=3 then
   begin
    p[1,1]:=p[2,1]+12;
    p[1,2]:=p[3,2];
   end;
  end;
 for i:=1 to 4 do pix[i]:=getpixel(p[i,1],p[i,2]);

 if ((pix[1]>0) or (pix[2]>0) or(pix[3]>0) or(pix[4]>0)) then
 begin
 for i:=1 to 4 do
  for j:=1 to 2 do p[i,j]:=a[i,j];
  dir:=d2;
 end;
dibujar;
end;
procedure tecla;
begin
k:=readkey;
borrar;
if k='q' then
begin
closegraph;
halt;
end;
if k='4' then
begin
 for i:=1 to 4 do pix[i]:=getpixel(p[i,1]-2,p[i,2]);
 if not ((pix[1]>0) or (pix[2]>0) or(pix[3]>0) or(pix[4]>0)) then
   for i:=1 to 4 do p[i,1]:=p[i,1]-12;
end;
if k='6' then
begin
 for i:=1 to 4 do pix[i]:=getpixel(p[i,1]+12,p[i,2]);
 if not ((pix[1]>0) or (pix[2]>0) or(pix[3]>0) or(pix[4]>0)) then
  for i:=1 to 4 do p[i,1]:=p[i,1]+12;
end;

if (k='s') or (k='d') or (k='5')then
 if not (v=4) then girar;

dibujar;
end;
begin
d:=detect;
initgraph(d,m,'');
rectangle(298,87,444,400);
rectangle(288,77,454,410);
randomize;
vel:=8000;
2:
empezar;
1:
repeat
for i:=1 to 4 do pix[i]:=0;

if (dir=1) then
begin
pix[4]:=getpixel(p[4,1],p[4,2]+12);
if ((v>0) and (v<4))or (v=5) then pix[1]:=getpixel(p[1,1],p[1,2]+12);
if v=6 then pix[3]:=getpixel(p[3,1],p[3,2]+12);
end;

if (dir=2) then
begin
for i:=2 to 4 do pix[i]:=getpixel(p[i,1],p[i,2]+12);
if v=0 then pix[1]:=getpixel(p[1,1],p[1,2]+12);
end;

if (dir=3) then
begin
pix[1]:=getpixel(p[1,1],p[1,2]+12);
if v>0 then pix[4]:=getpixel(p[4,1],p[4,2]+12);
end;


if (dir=4) then
begin
 pix[1]:=getpixel(p[1,1],p[1,2]+12);
 if v=0 then for i:=2 to 4 do pix[i]:=getpixel(p[i,1],p[i,2]+12);
 if v=1 then for i:=2 to 3 do pix[i]:=getpixel(p[i,1],p[i,2]+12);
 if v=2 then for i:=3 to 4 do pix[i]:=getpixel(p[i,1],p[i,2]+12);
 if v=3 then
 begin
   pix[2]:=getpixel(p[2,1],p[2,2]+12);
   pix[4]:=getpixel(p[4,1],p[4,2]+12);
 end;
end;

if v=4 then
begin
pix[3]:=getpixel(p[3,1],p[3,2]+12);
pix[4]:=getpixel(p[4,1],p[4,2]+12);
end;

if ((pix[1]>0) or (pix[2]>0) or(pix[3]>0) or(pix[4]>0)) then
begin
{(298,87,444,400); }
 for j:=1 to 4 do
 begin
  3:
  i:=288;
  b:=0;
  repeat
   i:=i+12;
   pix[1]:=getpixel(i,p[j,2]);
   if pix[1]=0 then b:=1;
  until (i=444);

  if b=0 then
  begin
     Size := ImageSize(299, 88,443,p[j,2]-1);
     GetMem(P1, Size);
     GetImage(299,88,443,p[j,2]-1, P1^);
     setfillstyle(1,0);
     bar(299, 88,443,p[j,2]+10);
     PutImage(299,100, P1^, NormalPut);
     FreeMem(p1, size);
{     sound(220);
     delay(500);
     nosound;
}     puntos:=puntos+1;
     goto 3;
  end;
 end;
 goto 2;
end;
borrar;
for i:=1 to 4 do p[i,2]:=p[i,2]+12;
dibujar;
if not (k='2') then
begin
{   delay(vel);
}
 for c1:=1 to vel do
 begin
  delay(1);
  if keypressed then tecla;
 end;
end;
until keypressed;
tecla;
goto 1;
end.