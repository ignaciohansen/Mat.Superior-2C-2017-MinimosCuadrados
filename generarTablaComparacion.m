
function [retval] = generarTablaComparacion (matriz, cantidad_decimales,fullfile)

  resultado_lineal = aproximacionLineal(cantidad_decimales,matriz)
  resultado_cuadratico = aproximacionParabola(cantidad_decimales,matriz)
  resultado_exponencial=aproximacionExponencial(cantidad_decimales,matriz)
  resultado_hiperbola=AproximacionHiperbola(cantidad_decimales,matriz)
  resultado_potencial=aproximacionPotencial(cantidad_decimales,matriz)
  
  
endfunction
