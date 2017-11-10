
function [retval] = aproximacionExponencial (decimales,matriz)

  matriz_redondeada= trunc(matriz,decimales);

  x1 = sum(power(matriz_redondeada(:,1),2)); #Sumatoria x^2
  x2 = sum(matriz_redondeada(:,1)); #Sumatoria x
  
  y1 = x2#Sumatoria x
  y2 = length(matriz_redondeada(:,1)); #cant numeros
  
  r1 = sum(matriz_redondeada(:,1).*log(matriz_redondeada(:,2))); #Sumatoria x*log(y)
  r2 = sum(log(matriz_redondeada(:,2)));  # sumatoria log y
  
  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  A = p(1);
  B = p(2);

  a=A;
  b=exp(B);
  
  coeficientes = [a,b];
  
  f = b * exp(a * matriz_redondeada(:,1)) #f(x)= b*e^ax

  error= sum(power(f-matriz_redondeada(:,2),2));
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
  
  disp(error)
 
  retval= [error,coeficientes,f'];

 endfunction