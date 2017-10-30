function [retval] = aproximacionPotencial (m)
function [retval] = aproximacionPotencial (decimales,matriz)
  
  matriz_redondeada= trunc(matriz,decimales);
  
  x1= length(matriz_redondeada(:,1)); #cant numeros
  x2= y1;
  
  y1= sum(log(matriz_redondeada(:,1))); #sumatoria log x
  y2= sum(power(log(matriz_redondeada(:,1)),2)); #sumatoria log^2x
 
  r1= sum(log(matriz_redondeada(:,2))); #sumatoria log y
  r2= sum(log(matriz_redondeada(:,1)).*log(matriz_redondeada(:,2))); #sumatoria logx*logy

  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  a= p(1);
  b= p(2);
  B= exp(b); # B= e^b
  f= (B*(power(matriz_redondeada(:,1),a)); #f(x)= Bx^a
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,p',f'];
  
return;
 
 endfunction
 endfunction