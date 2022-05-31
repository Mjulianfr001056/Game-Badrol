Uses crt, math;

Label
    Atas;

type
    pohon = array[0..5] of char; 

Var
    pilihan: integer;
    lagi: char;
    kebun : array[0..2] of pohon;
    tinggiPohon : array[0..2] of integer;

procedure buatKebun(idx : integer);
    var
        h, i: integer;
    begin
        h := 0;
        while h = 0 do h := random(7);
        
        for i := 0 to h do begin
            kebun[i, idx] := 'O';
        end;

        for i := h to 5 do begin
            kebun[i, idx] := ' ';
        end;
        
        tinggiPohon[idx] := h;
        if(idx < 2) then buatKebun(idx + 1);
    end;

procedure tebangPohon(ID_pohon, h : integer);
    var
        i, j : integer;
    
    begin

        for i := 5 downto 0 do
            begin
                if (kebun[i, ID_pohon] <> 'O') then continue;

                for j:= i downto i-h+1 do kebun[j, ID_pohon]:=' ';
                break;
            end;
            
        tinggiPohon[ID_pohon] := max(tinggiPohon[ID_pohon]-h, tinggiPohon[ID_pohon]); 
    end;

procedure tampilPohon();
    var
        a, x, y: integer;
        
    begin
        clrscr;

        gotoxy(15,2);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
        gotoxy(15,3);writeln('= = =                                                           =');
        gotoxy(15,4);writeln('= =                  Kondisi kebun saat ini                   = =');
        gotoxy(15,5);writeln('=                                                           = = =');
        gotoxy(15,6);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
       
        x:=38; y:=14;
        for a:=0 to 5 do
            begin
                gotoxy(x,y);
                writeln (a, ' ', kebun[a,0]);
                y:=y-1;
            end;
        gotoxy(35,15); writeln ('Pohon 1');

        x:=48; y:=14;
        for a:=0 to 5 do
            begin
                gotoxy(x,y);
                writeln (kebun[a,1]);
                y:=y-1;
            end;
        gotoxy(45,15); writeln ('Pohon 2');

        x:=58; y:= 14;
        for a:=0 to 5 do
            begin
                gotoxy(x,y);
                writeln (kebun[a,2]);
                y:=y-1;
            end;
        gotoxy(55,15); writeln ('Pohon 3');

        gotoxy(35,18); writeln;
    end;

function cekPohon(ID_pohon : integer) : boolean;
    var
        a : integer;
        result : boolean;
    begin
        result := true;

        for a := 5 downto 0 do
            begin
                if kebun[a, ID_pohon]='O' then begin
                    result := False;
                end; 
            end;   
        cekPohon := result or false;
    end;

function bisaDitebang(ID_pohon, h : integer) : boolean;
    begin
        writeln(tinggiPohon[ID_pohon]);
        if tinggiPohon[ID_pohon] >= h then bisaDitebang := true else bisaDitebang := false;
    end;

Procedure mainmudah;
    Label
        ulang_input_user,
        ulang_acak_pohon,
        ulang_acak_tinggi;

    var 
        ID_pohon, t_pohon : integer;   

    begin
        clrscr;
        buatKebun(0);
        
        repeat
            ID_pohon := 0;

            tampilPohon();
            
            ulang_input_user:
            
            write('Masukkan pohon yang akan Anda tebang = ');
            readln(ID_pohon);

            ID_pohon -= 1;
            
            write('Masukkan tinggi pohon yang Anda tebang = ');
            readln(t_pohon);

            if (bisaDitebang(ID_pohon, t_pohon)) then
                tebangPohon(ID_pohon, t_pohon)
            else begin
                writeln('Tidak dapat menebang pohon!');
                readkey;
                goto ulang_input_user;
            end;

            writeln('Badrol menebang ', t_pohon, ' dari pohon ke-', ID_pohon + 1);
            readkey();
            
            writeln('Pohon berhasil ditebang');
            
            if (cekPohon(0) and cekPohon(1) and cekPohon(2))then begin
                write('Selamat Anda telah memenangkan game ini');
                exit();
            end;
                
            tampilPohon();

            ulang_acak_pohon:
            ID_pohon:= random(3);
            
            ulang_acak_tinggi:
            t_pohon:= random(3);

            if (t_pohon=0) then
                goto ulang_acak_tinggi;
        
            if (not bisaDitebang(ID_pohon, t_pohon)) then
                goto ulang_acak_pohon;
            
            tebangPohon(ID_pohon, t_pohon);
            writeln('Sam menebang ', t_pohon, ' dari pohon ke-', ID_pohon + 1);
            readkey();   

            if (cekPohon(0) and cekPohon(1) and cekPohon(2)) then 
                write('Anda Kalah, Silakan Anda mencoba lagi');
            
        until (cekPohon(0) and cekPohon(1) and cekPohon(2));
    end;

Procedure mainsusah;
    Begin
        //forward;
    end;

Begin
    Atas:
    randomize;

    clrscr;
    gotoxy(15,2);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
    gotoxy(15,3);writeln('= = =                       WELCOME TO                          =');
    gotoxy(15,4);writeln('= =                                                           = =');
    gotoxy(15,5);writeln('=               TEBANG POHON BERSAMA BADROL & SAM           = = =');
    gotoxy(15,6);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
    gotoxy(46,7);writeln('= =');
    gotoxy(46,8);writeln('= =');
    gotoxy(35,9) ;writeln('= = = = = = = = = = = = =');
    gotoxy(35,10);writeln('=      PILIH LEVEL      =');
    gotoxy(35,11);writeln('=                       =');   
    gotoxy(35,12);writeln('=    1. MAIN SUSAH      =');    
    gotoxy(35,13);writeln('=    2. MAIN MUDAH      =');
    gotoxy(35,14);writeln('=    3. KELUAR          =');
    gotoxy(35,15);writeln('= = = = = = = = = = = = =');
    gotoxy(40,17);write  ('LEVEL ANDA : '); readln(pilihan);
    
    case pilihan of
        1:  Begin
            mainsusah;
            end;
        2:  Begin
            mainmudah;
            end;
        3:  Exit;
    else 
        begin
            gotoxy(40,19);writeln('PILIHAN ANDA SALAH');
            gotoxy(35,20);write('INGIN MENCOBA LAGI? (Y/T) : ');readln(lagi);
            If (lagi='Y') or (lagi='y') then
            GoTo Atas;
        end;
    end;

End.
