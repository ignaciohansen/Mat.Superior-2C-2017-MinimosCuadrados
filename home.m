function [retval] = home (m)

pkg load io;

opcion_menu_principal = 0;
opcion_menu_metodo_aproximacion = 0;
opcion_menu_aproximacion = 0;

prompt_valores = {"Cantidad de decimales","Ingrese el nombre del archivo .xsl"};
rowscols = [1;1.10];

%TODO: Valores hardcodeados
defaults = {"2","pruebaPotencial.xlsx"};

  while (1)
  opcion_menu_principal = menuPrincipal();
     
    switch (opcion_menu_principal)
      case 1
                                                                     %Hardcodeado
        row = inputdlg (prompt_valores,"Ingreso de datos", rowscols,defaults); 
        cantidad_decimales = row{1};
        filename = row{2};
        matriz_puntos = xlsread(filename);
        while (1)
        opcion_menu_metodo_aproximacion = menuMetodosAproximacion();
        
            switch(opcion_menu_metodo_aproximacion)
               case 1 %Aproximacion-Lineal
                 
                  resultado_lineal = aproximacionLineal(cantidad_decimales, matriz_puntos);
                     while(1)
                        opcion_menu_aproximacion = menuAproximacion();
                        
                        switch(opcion_menu_aproximacion)
                            case 1 %Funcion-Aproximante
                                msgbox(pritty_print_lineal(resultado_lineal));
                                
                            case 2 %Detalle Tabla
                            case 3 %Grafico
                                x=  matriz_puntos(:,1);
                                y0=  matriz_puntos(:,2);
                                y1=resultado_lineal(4:end);
                                graficar(x,y0,y1,"Lineal");
                            case 4 break;
                            otherwise break;
                        endswitch
                     endwhile
                  
               case 2 %Aproximacion-Cuadratica
                
                 resultado_cuadratico = aproximacionParabola(cantidad_decimales,matriz_puntos);
                      while(1)
                        opcion_menu_aproximacion = menuAproximacion();
                        
                        switch(opcion_menu_aproximacion)
                            case 1 %Funcion-Aproximante
                                msgbox(pritty_print_parabola(resultado_cuadratico));
                                
                            case 2 %Detalle Tabla
                            case 3 %Grafico
                                x= matriz_puntos(:,1);
                                y0= matriz_puntos(:,2);
                                y1=resultado_cuadratico(5:end);
                                graficar(x,y0,y1,"Parabolica");
                            case 4 break;
                            otherwise break;
                        endswitch
                     endwhile
                 
               case 3 %Aproximacion-Exponencial
                 
                  resultado_exponencial = aproximacionExponencial(cantidad_decimales,matriz_puntos);
                      while(1)
                        opcion_menu_aproximacion = menuAproximacion();
                        
                        switch(opcion_menu_aproximacion)
                            case 1 %Funcion-Aproximante
                                msgbox(pritty_print_exponencial(resultado_exponencial));
                                
                            case 2 %Detalle Tabla
                            case 3 %Grafico
                                x= matriz_puntos(:,1);
                                y0= matriz_puntos(:,2);
                                y1=resultado_exponencial(4:end);
                                graficar(x,y0,y1,"Exponencial");
                                
                            case 4 break;
                            otherwise break;
                        endswitch
                     endwhile
                 
               case 4 %Aproximacion-Potencial
                 
                 resultado_potencial = aproximacionPotencial(cantidad_decimales,matriz_puntos);
                      while(1)
                        opcion_menu_aproximacion = menuAproximacion();
                        
                        switch(opcion_menu_aproximacion)
                            case 1 %Funcion-Aproximante
                                msgbox(pritty_print_potencial(resultado_potencial));
                                
                            case 2 %Detalle Tabla
                            case 3 %Grafico
                                
                                x= matriz_puntos(:,1);
                                y0= matriz_puntos(:,2);
                                y1=resultado_potencial(4:end);
                                graficar(x,y0,y1,"Potencial");
                                
                            case 4 break;
                            otherwise break;
                        endswitch
                     endwhile
                 
               case 5 %Aproximacion-Hiperbola
                 
               case 6 break;
               otherwise break;
            endswitch
         endwhile
        
      case 2
        
      case 3 break;  
      otherwise break;       
    endswitch
  endwhile
      
endfunction