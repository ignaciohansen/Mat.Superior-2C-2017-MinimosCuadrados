function [retval] = aproximacionHiperbola(decimales,matriz)
   # 1/y = b/a + 1/a* x       
   # Y = B + A*X              Y=1/y,  b/a = B , A= 1/a , b=B*a , a=1/A
   # y = 1/B + 1/A*1/X          a/b = 1/B  a= 1/A 
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
  
  a=1/A;
  b=B/A;
  
  coeficientes = [a,b];
 
  f= ((a/(b+matriz_redondeada(:,1))); #f(x)= a / b+x
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,coeficientes,f'];
 
 endfunction