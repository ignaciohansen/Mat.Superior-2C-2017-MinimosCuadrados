function [retval] = aproximacionParabola (m)
function [retval] = aproximacionParabola (decimales,matriz)

  matriz_redondeada= trunc(matriz,decimales);
  
  x1= length(matriz_redondeada(:,1));
  x2= y1;
  x3= z1;
  
  y1= sum(matriz_redondeada(:,1));
  y2= z1;
  y3= z2;
  
  z1=sum(power(matriz_redondeada(:,1),2));
  z2=sum(power(matriz_redondeada(:,1),3));
  z3=sum(power(matriz_redondeada(:,1),4));
  
  r1= sum(matriz_redondeada(:,2));
  r2= sum(matriz_redondeada(:,1).*matriz_redondeada(:,2));
  r3= sum(power(matriz_redondeada(:,1),2).*matriz_redondeada(:,2));
  
  A= [trunc(x1,decimales),trunc(y1,decimales),trunc(z1,decimales);trunc(x2,decimales),trunc(y2,decimales),trunc(z2,decimales);trunc(x3,decimales),trunc(y3,decimales),trunc(z3,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales);trunc(r3,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  a= p(1);
  b= p(2);
  c= p(3);
  f= c+(b*matriz_redondeada(:,1))+(a*power(matriz_redondeada(:,1),2);
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,p',f'];
  
return;
 
 endfunction
 endfunction