function [retval] = aproximacionExponencial (m)
function [retval] = aproximacionExponencial (decimales,matriz)

  matriz_redondeada= trunc(matriz,decimales);
  
  x1= length(matriz_redondeada(:,1));  #cant numeros
  x2= y1;
  
  y1= sum(matriz_redondeada(:,1));  #sumatoria x
  y2= sum(power(matriz_redondeada(:,1),2));  #sumatoria x^2
 
  r1= sum(log(matriz_redondeada(:,2)));  # sumatoria log y
  r2= sum(matriz_redondeada(:,1).*log(matriz_redondeada(:,2)));  #sumatoria x*log y

  
  A= [trunc(x1,decimales),trunc(y1,decimales);trunc(x2,decimales),trunc(y2,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  a= p(1);
  b= p(2);
  B= exp(b); # B= e^b
  f= (B*exp(a*matriz_redondeada(:,1))) #f(x)= Be^ax
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,p',f'];
  
return;
 
 endfunction
 endfunction