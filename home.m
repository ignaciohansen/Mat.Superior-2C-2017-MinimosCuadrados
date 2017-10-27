function [retval] = home (m)

pkg load io;

opcion_menu_principal = 0;
opcion_menu_metodo_aproximacion = 0;
opcion_menu_aproximacion = 0;

prompt_valores = {"Cantidad de decimales","Ingrese el nombre del archivo .xsl"};
rowscols = [1;1.10];

  while (1)
  opcion_menu_principal = menuPrincipal();
     
    switch (opcion_menu_principal)
      case 1
        row = inputdlg (prompt_valores,"Ingreso de datos", rowscols); 
        cantidad_decimales = row{1};
        filename = row{2};
        puntos = xlsread(filename);
        while (1)
        opcion_menu_metodo_aproximacion = menuMetodosAproximacion();
        
            switch(opcion_menu_metodo_aproximacion)
               case 1
                     while(1)
                        opcion_menu_aproximacion = menuAproximacion();
                        
                        switch(opcion_menu_aproximacion)
                            case 1
                            case 2
                            case 3
                              
                            case 4 break;
                            otherwise break;
                        endswitch
                     endwhile
                  
               case 2
               case 3
               case 4
               case 5
                 
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