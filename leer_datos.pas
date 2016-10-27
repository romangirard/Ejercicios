program iris;

type registro = record
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                end;

var datos : file of registro;
    r : registro;
    i : integer;
begin
    i := 1;
    Assign(datos, 'iris.dat');
    Reset(datos);
    while not Eof(datos) do
    begin
        read(datos, r);
        
        writeln(i, ' ', r.Species, r.Sepal_Length, r.Sepal_Width, r.Petal_Length, r.Petal_Width);
        i := i +1;
    end;

    close(datos);

end.