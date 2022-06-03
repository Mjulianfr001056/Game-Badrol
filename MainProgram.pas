Uses crt, math;

Label
    Atas;

type
    pohon = array[0..5] of char; 

Var
    pilihan : integer;
    lagi: char;
    kebun : array[0..2] of pohon;
    tinggiPohon : array[-1..2] of integer;

procedure buatKebun(idx : integer);
    var
        h, i: integer;
    begin
        h := 0;
        while h = 0 do begin
            h := random(7);
        end;
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
            
        tinggiPohon[ID_pohon] -= h; 

    end;

procedure tampilPohon();
    var
        a, x, y: integer;
        
    begin
        clrscr;

        textColor(yellow);
        gotoxy(15,2);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
        gotoxy(15,3);writeln('= = =                                                           =');
        gotoxy(15,4);writeln('= =                  Kondisi kebun saat ini                   = =');
        gotoxy(15,5);writeln('=                                                           = = =');
        gotoxy(15,6);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
        
        textColor(white);
        x:=38; y:=14;
        for a:=0 to 5 do
            begin
                gotoxy(x,y);
                writeln (kebun[a,0]);
                y:=y-1;
            end;
        gotoxy(35,15); 
        
        textColor(yellow);
        writeln ('Pohon 1');

        textColor(white);
        x:=48; y:=14;
        for a:=0 to 5 do
            begin
                gotoxy(x,y);
                writeln (kebun[a,1]);
                y:=y-1;
            end;
        gotoxy(45,15); 
        
        textColor(yellow);
        writeln ('Pohon 2');

        textColor(white);
        x:=58; y:= 14;
        for a:=0 to 5 do
            begin
                gotoxy(x,y);
                writeln (kebun[a,2]);
                y:=y-1;
            end;
        gotoxy(55,15); 

        textColor(yellow);
        writeln ('Pohon 3');

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
        cekPohon := (result or false);
    end;

function bisaDitebang(ID_pohon, h : integer) : boolean;
    begin
        if tinggiPohon[ID_pohon] >= h then bisaDitebang := true else bisaDitebang := false;
        
    end;

function validasiInput(ID_pohon, h : integer) : boolean;
    var
        result : boolean;
    begin
        result := true;

        if (ID_pohon < 0) or (ID_pohon > 2) then result := false;
        if (h <> 1) and (h <> 2) then  result := false;

        validasiInput := false or result;
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
        buatkebun(0);

        repeat
            ID_pohon := 0;

            tampilPohon();
            
            ulang_input_user:
            
            write('Masukkan pohon yang akan Anda tebang = ');

            textcolor(green);
            readln(ID_pohon);
            textcolor(yellow);

            ID_pohon -= 1;
            
            write('Masukkan tinggi pohon yang Anda tebang = ');
            
            textcolor(green);
            readln(t_pohon);
            textcolor(yellow);

            if(not validasiInput(ID_pohon, t_pohon)) then begin
                textColor(red);
                write('Nilai yang Anda masukkan salah! Tekan <Enter>');
                textColor(yellow);
                readkey;
                tampilPohon();
                goto ulang_input_user;
            end;
            if (bisaDitebang(ID_pohon, t_pohon)) then
                tebangPohon(ID_pohon, t_pohon)
            else begin
                textColor(red);
                write('Tidak dapat menebang pohon! Tekan <Enter>');
                textColor(yellow);
                readkey;
                tampilPohon();
                goto ulang_input_user;
            end;

            write('Badrol berhasil menebang ');
            textColor(green);
            write(t_pohon);
            textColor(yellow);
            write(' dari pohon ke-');
            textColor(green);
            writeln(ID_pohon + 1);
            textColor(yellow);
            writeln('Tekan <Enter>');
            readkey;
            
            if (cekPohon(0) and cekPohon(1) and cekPohon(2))then begin
                textColor(white);
                write('Selamat Anda telah memenangkan game ini');
                exit();
            end;

            ulang_acak_pohon:
            ID_pohon:= random(3);
            
            ulang_acak_tinggi:
            t_pohon:= random(3);

            if (t_pohon=0) then
                goto ulang_acak_tinggi;
        
            if (not bisaDitebang(ID_pohon, t_pohon)) then
                goto ulang_acak_pohon;
            
            tampilPohon();
            
            tebangPohon(ID_pohon, t_pohon);

            write('Sam menebang ');
            textColor(green);
            write(t_pohon);
            textColor(yellow);
            write(' dari pohon ke-');
            textColor(green);
            writeln(ID_pohon + 1);
            textColor(yellow);
            writeln('Tekan <Enter>');
            readkey;

            textColor(white);
            if (cekPohon(0) and cekPohon(1) and cekPohon(2)) then 
                write('Anda Kalah, Silakan Anda mencoba lagi');
            
        until (cekPohon(0) and cekPohon(1) and cekPohon(2));
    end;

Procedure mainsusah;
    Label
        ulang_input_user;

    var 
        ID_pohon, t_pohon : integer;
        hotSauceColdSauce : array[-1..10] of integer;

    procedure SamBelajarDulu;
        var
            mex, cnt : integer;
        begin
            mex := 0;
            for cnt:= 0 to 10 do begin
                hotSauceColdSauce[cnt] := mex;
                inc(mex);
                if ( (mex xor 3) = 0 ) then mex := mex >> 2;
            end;
        end;

    procedure SamTebangPohon;
        var
            HM01_loc, HM01_t, i : integer;
            grumpy : array[-1..3] of integer;

        begin
            grumpy[0] := tinggiPohon[0];
            grumpy[0] := hotSauceColdSauce[grumpy[0]];

            grumpy[1] := tinggiPohon[1];
            grumpy[1] := hotSauceColdSauce[grumpy[1]];

            grumpy[2] := tinggiPohon[2];
            grumpy[2] := hotSauceColdSauce[grumpy[2]];

            HM01_t := grumpy[0];

            for i := 1 to 2 do begin
                HM01_t := (HM01_t xor grumpy[i]);
            end;
            
            if (HM01_t xor 3 = 0) then dec(HM01_t);
            
            for i := 0 to 2 do begin
                if ( grumpy[i] = HM01_t ) then HM01_loc := i;
            end; 
            
            if ( (HM01_t xor 0 = 0) ) then begin
                for i := 0 to 2 do begin
                    if ( tinggiPohon[i] <> 0 ) then begin
                        HM01_loc := i;
                        inc(HM01_t);
                        break;
                    end;
                end;
            end;

            tampilPohon();
            tebangPohon(HM01_loc, HM01_t);

            write('Sam menebang ');
            textColor(green);
            write(HM01_t);
            textColor(yellow);
            write(' dari pohon ke-');
            textColor(green);
            writeln(HM01_loc + 1);
            textColor(yellow);
            writeln('Tekan <Enter>');
            readkey;
        end;   
        
    function spareLife(): boolean;
        var
            grumpy : array[-1..3] of integer;
            spare, i : integer;
        begin
            grumpy[0] := tinggiPohon[0];
            grumpy[0] := hotSauceColdSauce[grumpy[0]];

            grumpy[1] := tinggiPohon[1];
            grumpy[1] := hotSauceColdSauce[grumpy[1]];

            grumpy[2] := tinggiPohon[2];
            grumpy[2] := hotSauceColdSauce[grumpy[2]];

            spare := grumpy[0];

            for i := 1 to 2 do begin
                spare := (spare xor grumpy[i]);
            end;

            if (spare xor 0 = 0) then spareLife := false else spareLife := true;
        end;

    begin
        clrscr;
        
        SamBelajarDulu;

        repeat
            buatkebun(0);
        until spareLife();

        repeat
            ID_pohon := 0;

            tampilPohon();
            
            ulang_input_user:
            
            write('Masukkan pohon yang akan Anda tebang = ');

            textcolor(green);
            readln(ID_pohon);
            textcolor(yellow);

            ID_pohon -= 1;
            
            write('Masukkan tinggi pohon yang Anda tebang = ');
            
            textcolor(green);
            readln(t_pohon);
            textcolor(yellow);

            if(not validasiInput(ID_pohon, t_pohon)) then begin
                textColor(red);
                write('Nilai yang Anda masukkan salah! Tekan <Enter>');
                textColor(yellow);
                readkey;
                tampilPohon();
                goto ulang_input_user;
            end;

            if (bisaDitebang(ID_pohon, t_pohon)) then
                tebangPohon(ID_pohon, t_pohon)
            else begin
                textColor(red);
                write('Tidak dapat menebang pohon! Tekan <Enter>');
                textColor(yellow);
                readkey;
                tampilPohon();
                goto ulang_input_user;
            end;

            write('Badrol berhasil menebang ');
            textColor(green);
            write(t_pohon);
            textColor(yellow);
            write(' dari pohon ke-');
            textColor(green);
            writeln(ID_pohon + 1);
            textColor(yellow);
            writeln('Tekan <Enter>');
            readkey;
            
            if (cekPohon(0) and cekPohon(1) and cekPohon(2))then begin
                textColor(white);
                write('Selamat Anda telah memenangkan game ini');
                exit();
            end;

            SamTebangPohon();

            textColor(white);
            if (cekPohon(0) and cekPohon(1) and cekPohon(2)) then 
                write('Anda Kalah, Silakan Anda mencoba lagi');
            
        until (cekPohon(0) and cekPohon(1) and cekPohon(2));
    end;

Begin
    Atas:
    randomize;

    clrscr;
    textcolor(yellow);
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
    gotoxy(40,17);write  ('LEVEL ANDA : '); 
    
    textColor(green);
    readln(pilihan);
    
    textColor(white);
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
