

function [retval] = pritty_print_lineal (resultado)
retval = strcat("p(x)= ", num2str(resultado(2)),
                          "*x + ",
                          num2str(resultado(3)));
endfunction
