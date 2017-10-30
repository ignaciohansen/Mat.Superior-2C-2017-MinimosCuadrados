function [retval] = aproximacionLineal (decimales,matriz)

  matriz_redondeada= trunc(matriz,decimales);
  
  x1= sum(power(matriz_redondeada(:,1),2)); #sumatoria x^2
  x2= sum(matriz_redondeada(:,1)); #sumatoria x
  
  y1= x2; #sumatoria x
  y2= length(matriz_redondeada(:,1)); #cantidad de puntos
  
  z1= sum(matriz_redondeada(:,1).*matriz_redondeada(:,2)); #sumatoria y*x
  z2= sum(matriz_redondeada(:,2)); #sumatoria y
  
  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(z1,decimales);trunc(z2,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  lineal= p(1);
  independiente= p(2);
  f= independiente+(lineal*matriz_redondeada(:,1));
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,p',f'];
  
 
 endfunction
 