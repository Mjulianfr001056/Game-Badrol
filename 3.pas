uses crt;

var 
    a, b, c : array[1..3, 1..1] of char;
    i,j : integer;
    
procedure TampilData;
begin
    a [1,1] := 'O';
    a [2,1] := 'O';
    a [3,1] := 'O';

    for i:=1 to 3 do
    begin   
        for j:=1 to 1 do 
            write (a[i,j]);
            writeln;
    end;
    writeln;
    Writeln ('A');
    writeln;

    b [1,1] := 'O';
    b [2,1] := 'O';
    b [3,1] := 'O';

    for i:=1 to 3 do
    begin   
        for j:=1 to 1 do 
            gotoxy(5,15); write (b[i,j]);
            writeln;
    end;
    writeln;
    Writeln ('B');
    writeln;

    c [1,1] := 'O';
    c [2,1] := 'O';
    c [3,1] := 'O';

    for i:=1 to 3 do
    begin   
        for j:=1 to 1 do 
             gotoxy(5,20); write (c[i,j]);
            writeln;
    end;
    writeln;
    Writeln ('C');
    writeln;
end;

begin
clrscr;
tampildata;
end.
