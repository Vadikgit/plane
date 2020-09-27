uses 
  Crt, GraphABC;

label W, G, H;

var
  ch: char;
  points, down, blowrad, butt, angle, randangle, c, radlev, incom, radlev2, incom2, del, rpl: integer;
  gr: real;
  neight: array[0..5] of integer;
  resfil:file;

procedure beg();
begin
  Assign (resfil, 'hgsc');

  SetPenWidth(1);
  SetBrushColor(clnavy);
  Rectangle(0, 0, 640, 600);
  setpenwidth(10);
  Setpencolor(clyellow);
  Rectangle(150, 50, 500, 200);
  Setfontcolor(clyellow);
  Setfontsize(70);
  TextOut(175, 75, 'aircraft');
  Setfontsize(20);
  TextOut(150, 250, 'Чтобы продолжить, нажми  ');
  TextOut(250, 280, '"Enter"');
  while (not (ord(readkey) = 13)) do 
  begin end;
end;


procedure countdown();//отсчитывает пять секунд перед началом от заезда
label k;
var
  c,j: integer;
begin
  Setfontcolor(clred);
  Setfontsize(17);
  SetBrushColor(clYellow);
  TextOut(150, 50, 'Для управления используй');
  TextOut(200, 80, 'клавиши "A" и "D"');
  Setfontsize(70);
  SetBrushColor(clblack);
  for c := 0 to 4 do 
  begin
    TextOut(280, 400, 5 - c);
    j:=0;
    for j := 0 to 50 do
    begin
      if (KeyPressed) then
        goto k;
      delay(1);
    end;
  end;
  goto k;
  k:
  SetBrushColor(clblue);
  Setpencolor(clblue);
  Rectangle(250, 450, 350, 520);
  Setfontsize(45);
  TextOut(180, 400, 'Полетели!!!');
  delay(1000);
  Setpencolor(clblack);
  SetPenWidth(1);
end;





procedure satlevel();
var
  i, j: integer;

begin
  Setpencolor(clblack);
  setpenwidth(4);
  arc(300, 300, incom, 0, 360);
  arc(300, 300, incom2, 0, 360);
  if down = 0 then
    for i := 0 to 5 do
      neight[i] := 45 * random(0, 7);
  
  
  for j := 0 to 2 do
  begin
    
    
    if incom = 260 then 
    begin
      
      neight[3] := 45 * random(0, 7);
      neight[4] := 45 * random(0, 7);
      neight[5] := 45 * random(0, 7);;
      
      radlev2 := 0;
      incom2 := 80;
    end;
    
    
    
    
    if incom = 440 then 
    begin
      neight[0] := 45 * random(0, 7);
      neight[1] := 45 * random(0, 7);
      neight[2] := 45 * random(0, 7);
      radlev := 0;
      incom := 80;
    end;
    
    circle(round(cos((neight[j + 3]) / gr) * (incom2) ) + 300, round(sin((neight[j + 3] ) / gr) * (incom2) ) + 300, radlev2);
    
    
    circle(round(cos((neight[j]) / gr) * incom ) + 300, round(sin((neight[j] ) / gr) * incom) + 300, radlev);
    
    SetBrushColor(clred);
    
  end;
end;



procedure satplane();
begin
  setpenwidth(10);
  
  Setpencolor(clpurple);
  arc(300, 300, 300, 0, 360);
  
  Setpencolor(clsilver);
  SetBrushColor(clsilver);
  
  line(round(cos((angle + 30) / gr) * (sqrt(2900)) ) + 300, round(sin((angle + 30 ) / gr) * (sqrt(2900)) ) + 300, round(cos(angle / gr) * 300 ) + 300, round(sin(angle / gr) * 300 ) + 300);
  line(round(cos((angle - 180 - 30) / gr) * (sqrt(2900)) ) + 300, round(sin((angle - 180 - 30) / gr) * (sqrt(2900)) ) + 300, round(cos((angle - 180) / gr) * 300 ) + 300, round(sin((angle - 180) / gr) * 300 ) + 300);
  
  
  
  
  line(round(cos((angle - 180) / gr) * (sqrt(2900)) ) + 300, round(sin((angle - 180 ) / gr) * (sqrt(2900)) ) + 300, round(cos((angle - 140) / gr) * sqrt(14500) ) + 300, round(sin((angle - 140) / gr) * sqrt(14500) ) + 300);
  line(round(cos((angle) / gr) * (sqrt(2900)) ) + 300, round(sin((angle ) / gr) * (sqrt(2900)) ) + 300, round(cos((angle - 40) / gr) * sqrt(14500) ) + 300, round(sin((angle - 40) / gr) * sqrt(14500) ) + 300);
  
  
  
  
  Setpencolor(clblack);
  setpenwidth(3);
  
  circle(round(cos((angle + 90) / gr) * 30 ) + 300, round(sin((angle + 90) / gr) * 30 ) + 300, 27);
  pie(round(cos((angle + 90) / gr) * 40 ) + 300, round(sin((angle + 90) / gr) * 40 ) + 300, 57, -angle, 180 - angle);
  
  
  circle(round(cos((angle + 20) / gr) * (sqrt(35 * 35 + 400)) ) + 300, round(sin((angle + 20) / gr) * (sqrt(35 * 35 + 400)) ) + 300, 30);
  circle(round(cos((angle - 200) / gr) * (sqrt(35 * 35 + 400)) ) + 300, round(sin((angle - 200) / gr) * (sqrt(35 * 35 + 400)) ) + 300, 30);
  SetBrushColor(clred);
  circle(round(cos((angle + 20) / gr) * (sqrt(35 * 35 + 400)) ) + 300, round(sin((angle + 20) / gr) * (sqrt(35 * 35 + 400)) ) + 300, 18);
  circle(round(cos((angle - 200) / gr) * (sqrt(35 * 35 + 400)) ) + 300, round(sin((angle - 200) / gr) * (sqrt(35 * 35 + 400)) ) + 300, 18);
end;



function lose(): boolean;

begin
  setpixel(2, 2, clred);
  
  lose := ((GetPixel(round(cos((angle + 3) / gr) * 290 ) + 300, round(sin((angle + 3) / gr) * 290 ) + 300).Equals(GetPixel(2, 2))  ) or (Getpixel(  round(cos((angle - 180 - 3) / gr) * 290 ) + 300, round(sin((angle - 180 - 3) / gr) * 290 ) + 300  ).Equals(GetPixel(2, 2))      ));
end;


function highsc(): integer;
var
hg:integer;
begin
  Reset(resfil);
  Read(resfil,hg);
  if (points > hg) then
  begin
    Rewrite(resfil);
    Write(resfil, points);
  end;
  Reset(resfil);
  Read(resfil,hg);
  highsc:=hg;
end;


procedure endgame();//настройка экрана в случае проигрыша

begin
  
  SetBrushColor(clblue);
  Rectangle(0, 0, 640, 600);
  Setfontcolor(clyellow);
  Setfontsize(35);
  TextOut(130, 130, 'ТЫ РАЗДОЛБАЛ');
  Setfontsize(50);
  TextOut(150, 200, 'САМОЛЁТ');
  TextOut(170, 280, '¯\_(ツ)_/¯');
  Setfontsize(25);
  TextOut(50, 390, 'ИТОГ:');
  TextOut(300, 390, 'РЕКОРД:');
  SetBrushColor(clblack);
  Setfontsize(30);
  TextOut(150, 390, points);
  Setfontcolor(clred);
  TextOut(450, 390, highsc);
  Setfontcolor(clyellow);
  Setfontsize(18);
  Rectangle(200, 445, 300, 485);
  TextOut(205, 450, '"Enter"');
  SetBrushColor(clred);
  TextOut(315, 450, '- играть ещё раз');
  
  SetBrushColor(clblack);
  Rectangle(250, 495, 330, 535);
  TextOut(255, 500, '"Esc"');
  SetBrushColor(clred);
  TextOut(345, 500, '- выйти');
  butt := ord(readkey);
  while((not (butt = 27)) and (not (butt = 13))) do begin butt := ord(readkey); end;
end;




//тело программы
begin
  
  beg();
  goto H;
  H:
  randomize;
  randangle := 45 * random(0, 7);
  gr := 57.262;
  SetWindowWidth(600);
  SetWindowHeight(600);
  angle := 0;
  down := 0;
  radlev := 0;
  radlev2 := 0;
  incom := 80;
  incom2 := 80;
  del := 50;
  rpl := 5;
  points := 0;
  
  goto W;
  W:
  incom := 80 + radlev * 3;
  incom2 := 80 + radlev2 * 3;
  if down < (rpl + 1) * 2  then
    incom2 := 1;
  c := 0;
  if (keypressed()) then ch := readkey();
  if ((ch = 'a') or (ch = 'ф') or (ch = 'A') or (ch = 'Ф')) then angle := angle - 45;
  if ((ch = 'd') or (ch = 'в') or (ch = 'D') or (ch = 'В')) then angle := angle + 45;
  ch := '@';
  Setpencolor(clred);
  setpenwidth(1);
  
  SetBrushColor(clblue);
  Rectangle(0, 0, 600, 600);
  
  Setpencolor(clblack);
  setpenwidth(4);
  
  
  SetBrushColor(clred);
  
  
  SetBrushColor(clblue);
  arc(300, 300, incom, 0, 360);
  
  Setpencolor(clyellow);
  line(round(cos((45) / gr) * 420 ) + 300, round(sin((45 ) / gr) * 420 ) + 300, round(cos((180 + 45) / gr) * 420 ) + 300, round(sin((180 + 45) / gr) * 420 ) + 300);
  line(round(cos((180 - 45) / gr) * 420 ) + 300, round(sin((180 - 45 ) / gr) * 420 ) + 300, round(cos(-45 / gr) * 420 ) + 300, round(sin(-45 / gr) * 420 ) + 300);
  Setpencolor(clblack);
  
  setpenwidth(1);
  SetBrushColor(clnavy);
  circle(300, 300, 75);
  SetBrushColor(clred);
  
  
  satlevel();
  satplane();
  if down = 0 then 
    countdown();
  if ((incom = 290) or (incom2 = 290)  ) then
    if lose = true then
      goto G;
  Setfontcolor(clyellow);
  setfontsize(30);
  Textout(20, 530, 'очки:');
  setfontsize(55);
  Textout(125, 530, points);
  
  delay(del);
  down := down + 1;
  radlev := radlev + rpl;
  radlev := radlev mod 120;
  radlev2 := radlev2 + rpl;
  radlev2 := radlev2 mod 120;
  points := points + 1;
  
  if del > 1 then  
    if down mod 21 = 0 then 
      del := del - 1;
  if del <= 5 then
    if ((rpl < 10) and (down mod 7 = 0)) then
      rpl := rpl + 1;
  
  
  while c <> 400000
    do
    c := c + 1;
  
  goto W;
  
  G:
  setbrushcolor(clred);
  delay(500);
  for blowrad := 0 to 10 do
  begin
    circle(300, 300, blowrad * 50);
    delay(10);
  end;
  endgame();
  if (butt = 13) then goto H;
  if (butt = 27) then halt;
end.