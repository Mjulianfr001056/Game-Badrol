uses crt;

var 
    x,y,a: integer;
    
procedure Batang;
begin
    for a:=1 to 4 do
    begin
        writeln ('O');
    end;
    writeln ('A');

    y:=1;
    x:=5;
    for a:=1 to 4 do 
    begin
    gotoxy(x,y); 
    writeln ('O');
    y:=y+1;
    end;
    gotoxy(5,5); writeln ('B');

    y:=1;
    x:=10;
    for a:=1 to 4 do 
    begin
    gotoxy(x,y); 
    writeln ('O');
    y:=y+1;
    end;
    gotoxy(10,5); writeln ('C');
end;

function Tebang (x):integer;
begin
    
end;

begin
    clrscr;
    batang;
end.