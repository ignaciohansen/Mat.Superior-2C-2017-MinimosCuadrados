function [retval] = graficar(x0,y0,y1, ttl)

  hold on

  plot(x0, y1)
  scatter(x0,y0); 
  xlabel("x");
  ylabel("p(x)");
  ttl = strcat("Aproximacion ",ttl);
  title (ttl);
  
  hold off

endfunction