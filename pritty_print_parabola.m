
function [retval] = pritty_print_parabola (resultado)
  retval = strcat("p(x)= ", 
                  num2str(resultado(4)),
                  "*x^2 + ",
                  num2str(resultado(3)),
                  "*x +" ,
                  num2str(resultado(2))
                  );
endfunction
