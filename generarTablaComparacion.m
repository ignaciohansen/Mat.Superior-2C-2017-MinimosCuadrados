
function [retval] = generarTablaComparacion (matriz, cantidad_decimales,fullfile)

  resultado_lineal = aproximacionLineal(cantidad_decimales,matriz)
  resultado_cuadratico = aproximacionParabola(cantidad_decimales,matriz)
  resultado_exponencial=aproximacionExponencial(cantidad_decimales,matriz)
  resultado_hiperbola=AproximacionHiperbola(cantidad_decimales,matriz)
  resultado_potencial=aproximacionPotencial(cantidad_decimales,matriz)
  
  matriz_redondeada= trunc(matriz,cantidad_decimales);
  cantidad_puntos= length(matriz_redondeada(:,1)); #cantidad de puntos
  indices = [1:cantidad_puntos]
  indices_columna =  num2cell(indices)
  
  funcion_lineal_cells = num2cell(resultado_lineal(4:cantidad_puntos+3))
  funcion_cuadratica_cells = num2cell(resultado_cuadratico(5:cantidad_puntos+4))
  funcion_exponencial_cells = num2cell(resultado_exponencial(4:cantidad_puntos+3))
  funcion_potencial_cells = num2cell(resultado_potencial(4:cantidad_puntos+3))
  funcion_hiperbola_cells = num2cell(resultado_hiperbola(4:cantidad_puntos+3))
  
   xlsrango_indices = strcat('A3:','A',num2str(cantidad_puntos+3))
   xlsrango_x = strcat('B3:','B',num2str(cantidad_puntos+3))
   xlsrango_y = strcat('C3:','C',num2str(cantidad_puntos+3))
   xlsrango_lineal = strcat('D3:','D',num2str(cantidad_puntos+3))
   xlsrango_cuadratico = strcat('E3:','E',num2str(cantidad_puntos+3))
   xlsrango_exponencial=strcat('F3:','F',num2str(cantidad_puntos+3))
   xlsrango_potencial=strcat('G3:','G',num2str(cantidad_puntos+3))
   xlsrango_hiperbola=strcat('H3:','H',num2str(cantidad_puntos+3))
   
   puntosx = matriz_redondeada(:,1)
   puntosy = matriz_redondeada(:,2)

 
 #Headers linea 1
 xlswrite(fullfile,'DATOS',"Comparacion",'B1')
 xlswrite(fullfile,'Modelos aproximantes',"Comparacion",'F1')
 
 #Headers linea 2
 xlswrite(fullfile,'Indice',"Comparacion",'A2')
 xlswrite(fullfile,'Xi',"Comparacion",'B2')
 xlswrite(fullfile,'Yi',"Comparacion",'C2')
 xlswrite(fullfile,'Mod 1 :Lineal',"Comparacion",'D2')
 xlswrite(fullfile,'Mod 2 :Cuadratico',"Comparacion",'E2')
 xlswrite(fullfile,'Mod 3 :Exponencial',"Comparacion",'F2')
 xlswrite(fullfile,'Mod 4 :Potencial',"Comparacion",'G2')
 xlswrite(fullfile,'Mod 5: Hiperbolico',"Comparacion",'H2')
 
 xlswrite(fullfile,'Error Modelo 1',"Comparacion",'I2')
 xlswrite(fullfile,'Error Modelo 2',"Comparacion",'J2')
 xlswrite(fullfile,'Error Modelo 3',"Comparacion",'K2')
 xlswrite(fullfile,'Error Modelo 4',"Comparacion",'L2')
 xlswrite(fullfile,'Error Modelo 5',"Comparacion",'M2')
  
  
  xlswrite(fullfile,indices_columna','Comparacion',xlsrango_indices) # Columna de indices
  xlswrite(fullfile,puntosx,"Comparacion",xlsrango_x) #Columna de puntos x
  xlswrite(fullfile,puntosy,"Comparacion",xlsrango_y) #Columna de puntos y
  xlswrite(fullfile,funcion_lineal_cells',"Comparacion",xlsrango_lineal) #Columna de puntos lineal
  xlswrite(fullfile,funcion_cuadratica_cells',"Comparacion",xlsrango_cuadratico) #Columna de puntos cuadratico
  xlswrite(fullfile,funcion_exponencial_cells',"Comparacion",xlsrango_exponencial) #Columna de puntos exponenciales
  xlswrite(fullfile,funcion_potencial_cells',"Comparacion",xlsrango_potencial) #Columna de puntos potenciales
  xlswrite(fullfile,funcion_hiperbola_cells',"Comparacion",xlsrango_hiperbola) #Columna de puntos de hiperbola
  
endfunction
