function [retval] = generarTablaParabola(decimales,matriz)

matriz_redondeada= trunc(matriz,decimales);

x1= length(matriz_redondeada(:,1)); #cant numeros
x2= y1; 
x3= z1;
  
y1= sum(matriz_redondeada(:,1)); #sumatoria x
y2= z1;
y3= z2; 

z1=sum(power(matriz_redondeada(:,1),2)); #sumatoria x^2
z2=sum(power(matriz_redondeada(:,1),3)); #sumatoria x^3
z3=sum(power(matriz_redondeada(:,1),4)); #sumatoria x^4
  
r1= sum(matriz_redondeada(:,2)); #sumatoria y
r2= sum(matriz_redondeada(:,1).*matriz_redondeada(:,2)); #sumatoria x*y
r3= sum(power(matriz_redondeada(:,1),2).*matriz_redondeada(:,2)); #sumatoria (x^2)*y

  
x=[matriz_redondeada(:,1);x2]
y=[matriz_redondeada(:,2);r1]
xcuadrado=[power(matriz_redondeada(:,1),2);z1]
xcubo=[power(matriz_redondeada(:,1),3);z2]
xcuarta=[power(matriz_redondeada(:,1),4);z3]
xy=[(matriz_redondeada(:,1).*matriz_redondeada(:,2));r2]
xcuadradoy=[power(matriz_redondeada(:,1),2).*matriz_redondeada(:,2);r3]

  
Directory = [pwd '\detalle.xlsx']; 

data_cells = num2cell(data)

title ={'X','Y','X^2','X^3','X^4','XY','X^2*Y'}

sumatoriasTitle = {'Ex','Ey','Ex^2','Ex^3','Ex^4','Eyx','Ex^2*y'}

sumatorias =  {x2,r1,z1,z2,z3,r2,r3}

output_matrix = [title; data_cells ; sumatoriasTitle ; sumatorias]

xlswrite(Directory,output_matrix,"Parabola")
 
 endfunction