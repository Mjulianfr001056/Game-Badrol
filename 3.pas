uses crt;

var 
    a, b, c : array[1..1, 1..3] of string [1] = ('O');
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

    b [1,1] := 'O';
    b [2,1] := 'O';
    b [3,1] := 'O';

    for i:=1 to 3 do
    begin   
        for j:=1 to 1 do 
            gotoxy(5,5); write (b[i,j]);
            writeln;
    end;
    writeln;
    Writeln ('B');

    c [1,1] := 'O';
    c [2,1] := 'O';
    c [3,1] := 'O';

    for i:=1 to 3 do
    begin   
        for j:=1 to 1 do 
             gotoxy(10,5); write (c[i,j]);
            writeln;
    end;
    writeln;
    Writeln ('A');
end;

begin
clrscr;
tampildata;
end.
