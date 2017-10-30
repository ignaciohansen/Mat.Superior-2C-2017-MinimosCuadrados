
function [retval] = pritty_print_parabola (funcion_aproximante)
  retval = strcat("p(x)= ", 
                  num2str(funcion_aproximante(4)),
                  "*x^2 + ",
                  num2str(funcion_aproximante(3)),
                  "*x +" ,
                  num2str(funcion_aproximante(2))
                  );
endfunction
