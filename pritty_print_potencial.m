
function [retval] = pritty_print_potencial (resultado)
  retval = strcat("p(x)= ",
                   num2str(resultado(3)), 
                   "*x^", 
                   num2str(resultado(2)));
endfunction
