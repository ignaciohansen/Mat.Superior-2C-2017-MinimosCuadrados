function [retval] = aproximacionPotencial (m)
function [retval] = aproximacionPotencial (decimales,matriz)
  
  matriz_redondeada= trunc(matriz,decimales);
  
  x1= length(matriz_redondeada(:,1));
  x2= y1;
  
  y1= sum(log(matriz_redondeada(:,1)));
  y2= sum(power(log(matriz_redondeada(:,1)),2));
 
  r1= sum(log(matriz_redondeada(:,2)));
  r2= sum(log(matriz_redondeada(:,1)).*log(matriz_redondeada(:,2)));

  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  a= p(1);
  b= p(2);
  B= exp(b);
  f= (B*(power(matriz_redondeada(:,1),a));
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,p',f'];
  
return;
 
 endfunction
 endfunction