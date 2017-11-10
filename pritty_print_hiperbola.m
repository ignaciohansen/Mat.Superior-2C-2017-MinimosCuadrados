## Copyright (C) 2017 Manu


function [retval] = pritty_print_hiperbola (resul)
retval = strcat("p(x)= ", 
                num2str(resul(2)),
                "/(", 
                num2str(resul(3)),
                " + x)");
endfunction
