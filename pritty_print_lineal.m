

function [retval] = pritty_print_lineal (funcion_aproximante)
retval = strcat("p(x)= ", num2str(funcion_aproximante(2)),
                          "*x + ",
                          num2str(funcion_aproximante(3)));
endfunction
