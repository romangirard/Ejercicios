program Entrega;

uses crt, math;
      
type registro = record
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                end;

          tipo = record      
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                    Distancia : real;
                  end;

                  

var       datos : file of registro;
          r : registro;
          i , j : integer;
          Muestras : array [1..120] of registro;
          Testeo: array [1..30] of registro;
          Distancias : array [1..120] of real;
          Ver: integer;
          Ss : integer;
          Vir : integer;
          s : integer;
          c : integer;
          WP : real;
          LP : real;
          V : Integer;
          T : string;
          opcion : Integer;
          const k=3;
      

          
    
         
          function distancia(x1 : real; y1 : real; x2 : real; y2: real) : real;
              begin
                   distancia := sqrt(power(x1 - x2,2) + power(y1 - y2,2));                  
              end;


          function tipos(x1 : real; y1 : real) : string;
            var Aux_distancia : real;
                aux_datos : registro;
                Ver: integer;
                Ss : integer;
                Vir : Integer;
                i:integer;
            begin
              Ver := 0;
              Ss := 0;
              Vir := 0;
                for i := 1 to 120 do
                  begin
                      Distancias[i]  := distancia(x1,y1, muestras[i].petal_length, muestras[i].Petal_Width);
                  end;    
                for i := 1 to 119 do
                begin
                      for j := i+1 to 120 do
                      begin
                                if Distancias[i] > Distancias[j] then
                                  begin
                                      Aux_datos := Muestras[i]; 
                                      Muestras[i] := Muestras[j];
                                      Muestras[j] := Aux_datos;


                                      Aux_distancia := Distancias[i];
                                      Distancias[i] := Distancias[j];
                                      Distancias[j] := Aux_distancia; 
                                  end;

                      end;
                 end;        
                for i := 1 to k do
                begin
                                if Muestras[i].Species = 'versicolor' then
                                begin
                                    Ver := ver + 1;
                                end
                                else
                                begin
                                    if Muestras[i].Species = 'setosa' then
                                    begin
                                                  Ss := Ss + 1;
                                    end
                                    else
                                    begin
                                                  vir := vir + 1;
                                    end;
                                 end; 
                                 end;
                                 if ver > Ss then
                                 begin
                                    if ver > vir then
                                    begin
                                            tipos := 'versicolor';
                                    end
                                    else
                                    begin
                                            tipos := 'virginica';
                                    end;
                                 end
                                 else
                                 begin
                                    if ss > vir then
                                    begin
                                        tipos := 'setosa';
                                    end
                                    else
                                    begin
                                            tipos := 'virginica';
                                    end;
                                 end;
                 end;
                        
begin
writeln('Si quiere verificar la especie de planta presione 1, para saber el porcentaje de acierto presione 2');

Ver := 1;
Ss := 1;
Vir := 1;
s := 1;
c := 1;
V := 0;

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

 ReadLn (opcion);

if opcion = 1 then
begin
WriteLn ('Ingrese el largo de la planta');
readln(LP);
WriteLn ('Ingrese el ancho de la planta');
readln(WP);
T := tipos(LP,WP);
writeln(T);
end
else
begin
for i := 1 to 30 do
  begin
 
      if  tipos(Testeo[i].Petal_Length, Testeo[i].Petal_Width) = testeo[i].Species then
        begin
            V := V+1;
        end;
  end;
writeln((V/30*100):3:2,'%');
end;
end.