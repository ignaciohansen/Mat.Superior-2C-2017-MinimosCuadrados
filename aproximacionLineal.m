function [retval] = aproximacionLineal (decimales,matriz)

  matriz_redondeada= trunc(matriz,decimales);
  
  x1= sum(power(matriz_redondeada(:,1),2));
  x2= sum(matriz_redondeada(:,1));
  
  y1= x2;
  y2= length(matriz_redondeada(:,1));
  
  z1= sum(matriz_redondeada(:,1).*matriz_redondeada(:,2));
  z2= sum(matriz_redondeada(:,2));
  
  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(z1,decimales);trunc(z2,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  a= p(1);
  b= p(2);
  f= b+(a*matriz_redondeada(:,1));
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,p',f'];
  
 
 endfunction
 