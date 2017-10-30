
function [retval] = pritty_print_exponencial (resultado)
 retval = strcat("p(X)= ",
                 num2str(resultado(3)), 
                 "*e^(", 
                 num2str(resultado(2)), 
                 "X)")
endfunction
