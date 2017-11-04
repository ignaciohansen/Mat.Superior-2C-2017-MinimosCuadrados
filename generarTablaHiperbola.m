function [retval] = generarTablaHiperbola(decimales,matriz)

matriz_redondeada= trunc(matriz,decimales);

x1 = sum(power(matriz_redondeada(:,1)),-2); #sumatoria 1/x^2
x2 = sum(power(matriz_redondeada(:,1)),-1); #sumatoria 1/x
  
y1 = x2 #sumatoria 1/x
y2 = length(matriz_redondeada(:,1)); #cant numeros
  
r1 = sum((power(matriz_redondeada(:,1),-1)).*(power(matriz_redondeada(:,2),-1))); #sumatoria 1/x*1/y
r2 = sum(power(matriz_redondeada(:,2),-1)); #sumatoria 1/y
  
unosobrex=[power(matriz_redondeada(:,1),-1);x2]
unosobrey=[power(matriz_redondeada(:,2),-1);r2]
unosobrexcuadrado=[power(matriz_redondeada(:,1),-2);x1]
unosobrexporunosobrey=[power(matriz_redondeada(:,1),-1).*power(matriz_redondeada(:,2),-1);r1]

Directory = [pwd '\detalle.xlsx']; 

data_cells = num2cell(data)

title ={'X=1/x','Y=1/y','X^2=1/x^2','XY=1/X*1/Y'}

sumatoriasTitle = {'EX','EY','EX^2','EXY'}

sumatorias =  {x2,r2,x1,r1}

output_matrix = [title; data_cells ; sumatoriasTitle ; sumatorias]

 xlswrite(Directory,output_matrix,"Hiperbola")
 
 endfunction
