function [retval] = aproximacionHiperbolaOpcional (decimales,matriz)
  
  matriz_redondeada= trunc(matriz,decimales);
  
  x1 = sum(power(matriz_redondeada(:,1)),-2)); #sumatoria 1/x^2
  x2 = sum(power(matriz_redondeada(:,1)),-1); #sumatoria 1/x
  
  y1 = x2 #sumatoria 1/x
  y2 = length(matriz_redondeada(:,1)); #cant numeros
  
  r1 = sum(power(matriz_redondeada(:,1)),-1).*(power(matriz_redondeada(:,2)),-1); #sumatoria 1/x*1/y
  r2 = sum(power(matriz_redondeada(:,2)),-1); #sumatoria 1/y

  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales)];
  
  p= inv(A)*B;
  p= trunc(p,decimales);
  
  A= p(1);
  B= p(2);
  
  a=1/B;
  b=A*B;
  
  coeficientes = [a,b];
 
  f= ((a*(matriz_redondeada(:,1)))/(b+matriz_redondeada(:,1))); #f(x)= a*x/b+x
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,coeficientes,f'];
 
 endfunction