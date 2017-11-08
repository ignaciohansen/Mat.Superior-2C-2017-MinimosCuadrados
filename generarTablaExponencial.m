function [retval] = generarTablaExponencial(decimales,matriz,fullfile)

matriz_redondeada= trunc(matriz,decimales);

x1 = sum(power(matriz_redondeada(:,1),2)); #Sumatoria x^2
x2 = sum(matriz_redondeada(:,1)); #Sumatoria x
  
y1 = x2#Sumatoria x
y2 = length(matriz_redondeada(:,1)); #cant numeros
  
r1 = sum(matriz_redondeada(:,1).*log(matriz_redondeada(:,2))); #Sumatoria x*log(y)
r2 = sum(log(matriz_redondeada(:,2)));  # sumatoria log y
  
x=[matriz_redondeada(:,1);x2]
xcuadrado=[power(matriz_redondeada(:,1),2);x1]
lny=[log(matriz_redondeada(:,2));r2]
xlny=[matriz_redondeada(:,1).*log(matriz_redondeada(:,2));r1]

data = [x,xcuadrado,lny,xlny] 
 


data_cells = num2cell(data)

title ={'X','X^2','Y=ln(y)',' X*Y=Xln(y)'}

sumatoriasTitle = {'EX','EX^2','EY','EXY'}

sumatorias =  {x2,x1,r2,r1}

output_matrix = [title; data_cells ; sumatoriasTitle ; sumatorias]

 xlswrite(fullfile,output_matrix,"Exponencial")
 
 sistemaEcuaciones = sprintf(strcat(num2str(x1),'*a + ',num2str(x2),'*b =',num2str(r1),'\n',
                           num2str(x2),'*a + ',num2str(y2),'*b =',num2str(r2)));
  msgbox(sistemaEcuaciones,'Sistema de ecuaciones')
 
 endfunction