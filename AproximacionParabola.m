function [retval] = aproximacionParabola (decimales,matriz)

  matriz_redondeada= trunc(matriz,decimales);
  
  double x1;
  double x2;
  double x3;
  double y1;
  double y2;
  double y3;
  double z1;
  double z2;
  double z3;
  
  x1= length(matriz_redondeada(:,1)); #cant numeros
  
  y1= sum(matriz_redondeada(:,1)); #sumatoria x
  
  z1=sum(power(matriz_redondeada(:,1),2)); #sumatoria x^2
  z2=sum(power(matriz_redondeada(:,1),3)); #sumatoria x^3
  z3=sum(power(matriz_redondeada(:,1),4)); #sumatoria x^4
  
  y2= z1;
  y3= z2;
  
  x2= y1; 
  x3= z1;
  
  r1= sum(matriz_redondeada(:,2)); #sumatoria y
  r2= sum(matriz_redondeada(:,1).*matriz_redondeada(:,2)); #sumatoria x*y
  r3= sum(power(matriz_redondeada(:,1),2).*matriz_redondeada(:,2)); #sumatoria (x^2)*y
  
  A= [trunc(x1,decimales),trunc(y1,decimales),trunc(z1,decimales);trunc(x2,decimales),trunc(y2,decimales),trunc(z2,decimales);trunc(x3,decimales),trunc(y3,decimales),trunc(z3,decimales)];
  B= [trunc(r1,decimales);trunc(r2,decimales);trunc(r3,decimales)];
  
  p= inv(A)*B;
  
  p= trunc(p,decimales);
  
  cuadratico= p(1);
  lineal= p(2);
  independiente= p(3);
  
  coeficientes = [cuadratico,lineal,independiente];
  
  f= independiente+(lineal*matriz_redondeada(:,1))+(cuadratico*power(matriz_redondeada(:,1),2));
  error= sum(matriz_redondeada(:,2)-f);
  
  f=trunc(f,decimales);
  error= trunc(error,decimales);
 
  retval= [error,coeficientes,f'];
 
endfunction
