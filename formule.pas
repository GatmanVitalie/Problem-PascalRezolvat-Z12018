program formule;
{linkul către problemă : https://aee.edu.md/sites/default/files/ol18info_z1_cl10-12_ro.pdf }
var
  a: char;
  V, nr, pr1, pr2, cont: boolean;
  prn: integer;

begin
  V := true; //este adevărat
  nr := false; //este nr
  pr1 := false;  //(
  pr2 := false;  //)
  prn := 0; //verifică dacă nr de paranteze '(' este egal cu nr de paranteze ')'
  cont := false;
  while true do //repetă la infinit
  begin
    read(a);
    if V = true then // dacă V am aflat deza că este fals nu are sens să verificăm a
    begin
      
      {eu iau în paranteze ca să convertes explesiile în boolean cum ar fi '(a >= '0') and (a <= '9')' dacă
      nu le-as fi luat ]n paranteze codul nu ar fi funcționat deoarece funția 'and' funcționează numai pentru boolean.}
      if (a >= '0') and (a <= '9') then //verifică dacă a este nr
      begin
        if pr2 = true then
        begin
          V := false;
        end
        else
      begin
          nr := true; 
          pr1 := false;
          cont := true;
        end;
        
      end
      
      else if (a = '/') or (a = '*') or (a = '-') or (a = '+') then //verifică dacă a este semn
      begin
        if nr = false or pr1 = true then
        begin
          V := false;
        end
        else
      begin
          nr := false;
          pr2 := false;
          cont := true;
        end;
      end
      
      else if a = '(' then // (
      begin
        if nr = true then
        begin
          V := false;
        end
        else
      begin
          pr1 := true;
          prn := prn - 1;  // valoare prn = valoarea curentă prn - 1. De exemplu dacă prn = 3 prn := 3-1 :=2;F
        end;
      end
      
      else if a = ')' then
      begin
        if nr = false then
        begin
          V := false;
        end
        else
      begin
          prn := prn + 1;
          pr2 := true;
        end;
      end;
      
      if (a = #13) then // verifica daca tasta enter a fost apasata
      begin
        if cont = false then
        begin
          break;
        end;
        if prn <> 0 then
        begin
          V := false;
        end;
        if V = true then
        begin
          Writeln('DA');
        end
        ELSE
      begin
          Writeln('NU');
        end;
        V := true;
        nr := false; 
        pr1 := false;
        pr2 := false; 
        prn := 0;
        cont := false;
        continue; // nu vreu  să verific din nou dacă a = tata enter
      end;
    end;
    if (a = #13) then // verifica daca tasta enter a fost apasata
    begin
      if cont = false then
      begin
        break;
      end;
      if prn <> 0 then
      begin
        V := false;
      end;
      if V = true then
      begin
        Writeln('DA');
      end
      ELSE
      begin
        Writeln('NU');
      end;
      V := true;
      nr := false; 
      pr1 := false;
      pr2 := false; 
      prn := 0;
      cont := false;
    end;
  end;
end.