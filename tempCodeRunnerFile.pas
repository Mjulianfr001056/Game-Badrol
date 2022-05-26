uses crt;

var 
    a, b, c : array[1..1, 1..3] of string [1] = ('O');
    x,i,j : integer;
    
procedure TampilData;
begin
    a [1,1] := 'O';
    a [1,2] := 'O';
    a [1,3] := 'O';

    for i:=1 to 1 do
    begin   
        for j:=1 to 3 do 
            write (a[i,j]);
            writeln;
    end;
end;

begin
clrscr;
TampilData;
end.
