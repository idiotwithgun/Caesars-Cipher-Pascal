program caesar;
var choice : integer;
var text : string;
var number : integer;

function NoYO (text : string): string;
begin
  for var i :=1 to Length(text) do begin
    if ord(text[i]) = 1105 then text[i] := chr(1077);
    if ord(text[i]) = 1025 then text[i] := chr(1045);
  end;
  NoYO := text;
end;

function Upper (text : string) : string;
  begin
    text := NoYO(text);
    for var i := 1 to Length(text) do begin
      if (ord(text[i]) > 1071) and (ord(text[i]) < 1104) then text[i] := chr(ord(text[i]) - 32)
    end;
  Upper := text;
end;

procedure EncAndDec (text : string; number : integer);
begin
     text := Upper(text);
     for var i := 1 to Length(text) do begin
       if (ord(text[i]) < 1040) or (ord(text[i]) > 1071) then text[i] := text[i] else
       if ((ord(text[i]) + number) > 1039) and ((ord(text[i]) + number) < 1072) then text[i] := chr(ord(text[i]) + number) else
       if ((ord(text[i]) + number) > 1071) then text[i] := chr(ord(text[i]) + number - 32) else
       if ((ord(text[i]) + number) < 1040) then text[i] := chr(ord(text[i]) + number + 32)
     end;
     writeln('сдвиг на ',(number mod 32),': ',text);
end;

procedure Solve (text : string);
begin
     for var i := 32 downto 1 do begin
       EncAndDec(text, i);
     end
end;

begin
writeln('Выберите режим:');
writeln('1 - Расшифровка с известным ключом/Зашифровка');
writeln('2 - Показать все возможные сдвиги текста');
readln(choice);
if choice = 1 then 
begin
  writeln('Введите текст');
  readln(text);
  writeln('Введите ключ');
  readln(number);
  writeln('Расшифровка');
  EncAndDec(text,(number mod 32));
  writeln();
  writeln('программа завершила свою работу, нажмите ENTER чтобы выйти.');
  readln(text);
end;
if choice = 2 then 
begin
  writeln('Введите текст');
  readln(text);
  writeln('Расшифровка');
  Solve(text);
  writeln();
  writeln('программа завершила свою работу, нажмите ENTER чтобы выйти.');
  readln(text);
end;
if (choice = 1) or (choice = 2) then exit
else
begin
  writeln('Ошибка: введено значение не являющееся 1 или 2, нажмите ENTER чтобы выйти.');
  readln(text);
end;
end.