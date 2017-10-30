function [retval] = aproximacionPotencial (decimales,matriz)
  
  matriz_redondeada= trunc(matriz,decimales);
  
  x1 = sum(power(log(matriz_redondeada(:,1)),2)); #sumatoria log(x) ^ 2
  x2 = sum(log(matriz_redondeada(:,1))); #sumatoria log x
  
  y1 = x2 #sumatoria log x
  y2 = length(matriz_redondeada(:,1)); #cant numeros
  
  r1 = sum(log(matriz_redondeada(:,1)).*log(matriz_redondeada(:,2))); #sumatoria logx*logy
  r2 = sum(log(matriz_redondeada(:,2))); #sumatoria log y

  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales)];
  
  p= inv(A)*B;
  p= trunc(p,decimales);
  
  A= p(1);
  B= p(2);
  
  a=A;
  b=exp(B);
  
  coeficientes = [a,b];
 
  f= (b*(power(matriz_redondeada(:,1),a))); #f(x)= b*x^a
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,coeficientes,f'];
 
 endfunction
