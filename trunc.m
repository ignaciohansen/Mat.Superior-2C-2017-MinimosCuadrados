
function [retval] = trunc (m, dec)
  
   d = power(10,str2double(dec));
   retval = round(m.* d)./ d;
     
endfunction

