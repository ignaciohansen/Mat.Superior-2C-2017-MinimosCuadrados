function [retval] = generarTablaPotencial(decimales,matriz)

matriz_redondeada= trunc(matriz,decimales);

  x1 = sum(power(log(matriz_redondeada(:,1)),2)); #sumatoria log(x) ^ 2
  x2 = sum(log(matriz_redondeada(:,1))); #sumatoria log x
  
  y1 = x2 #sumatoria log x
  y2 = length(matriz_redondeada(:,1)); #cant numeros
  
  r1 = sum(log(matriz_redondeada(:,1)).*log(matriz_redondeada(:,2))); #sumatoria logx*logy
  r2 = sum(log(matriz_redondeada(:,2))); #sumatoria log y

  
lnx=[log(matriz_redondeada(:,1));x2]
lny=[log(matriz_redondeada(:,2));r2]
lnxcuadrado=[power(log(matriz_redondeada(:,1)),2);x1]
lnxlny=[log(matriz_redondeada(:,1)).*log(matriz_redondeada(:,2));r1]

  
Directory = [pwd '\detalle.xlsx']; 

data_cells = num2cell(data)

title ={'X=ln(x)','Y=ln(y)','X^2=ln(x)^2','X*Y=ln(x)ln(y)'}

sumatoriasTitle = {'EX','EY','EX^2','EXY'}

sumatorias =  {x2,r2,x1,r1}

output_matrix = [title; data_cells ; sumatoriasTitle ; sumatorias]

 xlswrite(Directory,output_matrix,"Potencial")
 
 endfunction