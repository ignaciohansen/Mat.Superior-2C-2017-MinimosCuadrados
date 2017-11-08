
function [retval] = generarTablaLineal (decimales,matriz)

  #Dejo bien comentado como se hace esta tabla paso a paso.

  #1. Generar la matrix redondeada
  matriz_redondeada= trunc(matriz,decimales);

  #2. Hacer las sumatorias correspondientes a la aproimacion
  x1= sum(power(matriz_redondeada(:,1),2)); #sumatoria x^2
  x2= sum(matriz_redondeada(:,1)); #sumatoria x
  
  y1= x2; #sumatoria x
  y2= length(matriz_redondeada(:,1)); #cantidad de puntos
  
  z1= sum(matriz_redondeada(:,1).*matriz_redondeada(:,2)); #sumatoria y*x
  z2= sum(matriz_redondeada(:,2)); #sumatoria y
  
  #3. Es el path absoluto donde va a guarda la tabla. Por ahora dejamos esta, SIEMPRE
  Directory = [pwd '\detalle.xlsx']; 

  
  #4. Asignamos las columnas de la matriz a las variables asociadas
  # por ejemplo
  # power(matriz_redondeada(:,1),2) es la columna de los x elevado al cuadrado
  # al hacer [power(matriz_redondeada(:,1),2);x1] le estamos concatenando al final de la columna
  # el resultado de su sumatoria que conseguimos arriba
  
  x = [matriz_redondeada(:,1);x2]
  xcuadrado = [power(matriz_redondeada(:,1),2);x1]
  y = [matriz_redondeada(:,2);z2]
  yx = [(matriz_redondeada(:,1).*matriz_redondeada(:,2));z1]
  
  #5.Definimos la tabla que contiene en si, la informacion.
  data = [x,y,xcuadrado,yx]
  
  #6. Parseamos la tabla para poder manipularla facilmente
  data_cells = num2cell(data)  %Convert data to cell array
  
  #7. Definimos fila que representa el header de cada columna.
  title ={'X','Y','X^2','XY'}
  
  #8. Definimos fila que representa el footer de cada columna. Sera la sumatoria correspondiente
  sumatoriasTitle = {'Ex','Ey','Ex^2','Eyx'}
  
  #9. Definimos la ultima fila, que son los valores de las sumatorias
  sumatorias =  {x2,z2,x1,z1}  
  
  #Muy importante tener bien sincronizado el orden de las cosas
  
  #10. Mergeamos todo en una sola matrix
  output_matrix = [title; data_cells ; sumatoriasTitle ; sumatorias]
  
 
  #11. Hacemos la salida IO para escribir en el archivo excel
  # Es importante el 3er argumento. Es el que crea la pestana dentro del .xlsx
  # Debe llevar el nombre de la aproximacion realizada
  xlswrite(Directory,output_matrix,"Lineal")
  
  sistemaEcuaciones = sprintf(strcat(num2str(x1),'*a + ',num2str(x2),'*b =',num2str(z1),'\n',
                           num2str(x2),'*a + ',num2str(y2),'*b =',num2str(z2)))
  msgbox(sistemaEcuaciones,'Sistema de ecuaciones')
  
  #Importante considerar que el xlswrite no limpia el archivo y luego escribe, sino que solo escribe.

endfunction
