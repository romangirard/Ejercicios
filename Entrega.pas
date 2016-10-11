program entrega1;

uses crt;

type registro = record
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                end;

var       datos : file of registro;
          r : registro;
          i , j : integer;
          Muestras : array [1..120] of registro;
          Testeo: array [1..30] of registro;
          Ver: integer;
          Ss : integer;
          Vir : integer;
          s : integer;
          c : integer;

begin

Ver := 1;
Ss := 1;
Vir := 1;
s := 1;
c := 1;

assign(datos, 'iris.dat');

reset(datos);

while not eof(datos) do
  begin
  read(datos, r);   
    if (r.Species = 'setosa')  then 
    begin
          if (Ss <=10) then
          begin
              Testeo[s] := r;
              s := s+1;
              Ss := Ss + 1;  
          end
          else
          begin
            Muestras[c] := r;
            c := c + 1;
          end;
    end;
    if (r.Species = 'virginica') then
    begin
        if (Vir <=10) then
          begin
              Testeo[s] := r;
              s := s+1;
              Vir := Vir + 1;  
          end
          else
          begin
            Muestras[c] := r;
            c := c + 1;
          end;
    end;
    if (r.Species = 'versicolor')  then
    begin
        if (Ver <=10) then
          begin
              Testeo[s] := r;
              s := s + 1;
              Ver := Ver + 1;
          end
          else
          begin
            Muestras[c] := r;
            c := c + 1;
          end;
    end;
  end;

close(datos);

for i := 1 to 120 do
  begin
      writeln(i, ' ',Muestras[i].Species);
      readkey();  
  end;

for j := 1 to 30 do
  begin
      writeln(j, '  ', Testeo[j].Species);
      readkey();     
  end;

end.