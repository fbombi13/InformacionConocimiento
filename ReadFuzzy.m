%% Sistema de Inferencia Difuso
% *Se realiza un sistema de inferencia difuso con Mamdani*
% 
%% Codigo
tabla = readtable('DataEstudiantes.csv');  %%Lee el archivo csv
tabla
Nombres= tabla.Nombre;                              
datos= removevars(tabla,{'Nombre'}).Variables;      %%Saca los datos numericos del archivo
fis = readfis('Conocimiento.fis');                  %%abre el sistema de inferencia difusa
Reglas= fis.Rules                                           %% Muestra las reglas
plotfis(fis);                                       %%Imprime el sistema
resultados = evalfis(fis,datos);                    %%Almacena resultados
datosFinales = [Nombres, num2cell(resultados)];     %%Genera una matriz de relacion
for index =1: length(datosFinales(:,2))
     if (resultados(index)>= 3) 
         datosFinales(index,3)=cellstr("Paso");     %%Se acondiciona la salida al tipo Paso o no paso
     else
         datosFinales(index,3)=cellstr("No Paso");
     end
end
datosFinales



 