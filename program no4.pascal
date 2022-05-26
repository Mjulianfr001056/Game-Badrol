program no4;
uses crt;
var
    buah,pohon :integer;
begin
case pilihan of
2: begin
    repeat
    write('Masukkan buah yang ingin diambil = ');
    readln(buah);
    write('Masukkan pohon yang ingin diambil buahnya = ');
    readln(pohon);
    if (buah=1) and (buah>0) then
    begin
        buah:=buah-1;
        writeln('sisa buah di pohon',pohon,'= ',buah);
    end;
    if (buah=2)  and (buah>0) then
    begin
        buah:=buah-2;
        writeln('sisa buah di pohon',pohon,'= ',buah);
    end;
    until (n=0);
    end;
    
end.
