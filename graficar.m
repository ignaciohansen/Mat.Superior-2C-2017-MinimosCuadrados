function [retval] = graficar(x0,y0,y1, tipo_aproximacion)

  hold on

  plot(x0, y1)
  scatter(x0,y0); 
  xlabel("x");
  ylabel("p(x)");
  tipo_aproximacion = strcat("Aproximacion ",tipo_aproximacion);
  title (tipo_aproximacion);
  
  hold off

endfunction