clc;
clear;

pkg load control;
pkg load signal;

# global para no tener que pasar por parametro en todas las functions
global funcionTransferencia
 
function ret = getFuncionTransferencia
  
  global funcionTransferencia
  ret = funcionTransferencia;
endfunction

function setFuncionTransferencia(val)
  global funcionTransferencia
  funcionTransferencia = val;
endfunction

# Mostrar expresion
function getExpresion
  # Forma mas clara para mostrar la funcion
  G=getFuncionTransferencia
endfunction

function getExpresionForma2
  # Obtengo el numerador y el denominador
  [numerador,denominador,tsam]=tfdata(getFuncionTransferencia);
  # Los paso de cell class a matriz
  numerador=cell2mat(numerador);
  denominador=cell2mat(denominador);
  # Armo los polinmios
  numerador=polyout(numerador, 's');
  denominador=polyout(denominador, 's');
  # Se muestra la funcion ingresada, por lo que vi deberia usarse sysout, pero no entendi como
  printf('La expresion de la funcion transferencia es:\n');
  printf('\t( ');
  printf(numerador);
  printf(' ) / ( ');
  printf(denominador);
  printf(' )\n');
endfunction

# Indicar polos
function getPolos
  # Obtengo los polos
  [ceros,polos,ganancia] = tf2zp(getFuncionTransferencia);
  # Los muestro
  polos
endfunction

# Indicar ceros
function getCeros
  # Obtengo los ceros
  [ceros,polos,ganancia] = tf2zp(getFuncionTransferencia);
  # Los muestro
  ceros
endfunction

# Indicar ganancia
function getGanancia
  # Obtengo la ganancia
  [ceros,polos,ganancia] = tf2zp(getFuncionTransferencia);
  # La muestro
  printf('La ganancia es: %i\n', ganancia);
endfunction

# Indicar Expresion, Ceros, Polos y Ganancia
function getExprCerosPolosGan
  getExpresion
  getCeros
  getPolos
  getGanancia
endfunction

# Obtener grafico
function getGrafico
  # Grafico ceros y polos
  pzmap(getFuncionTransferencia);
  title('Constelacion de polos y ceros');
  legend("Polos","Ceros");
  xlabel("Eje Real");
  ylabel("Eje Imaginario");
endfunction

# Indicar estabilidad
function getEstabilidad
  [ceros,polos,ganancia] = tf2zp(getFuncionTransferencia);
  i=1;
  flag=0;
  while(i <= length(polos))
     if(real(polos(i)) > 0)
        flag = 1;
        break;
     endif
     i++;
  endwhile
  if(flag == 1)
    printf('El sistema es inestable\n');
  else
    printf('El sistema es estable\n');
  endif
endfunction

# Obtener todas las funcionalidades
function getAll
  getExprCerosPolosGan
  getGrafico
  getEstabilidad
endfunction

# Menu de informacion
function mostrarMenuDeInformacion
  printf('Seleccione una opcion ingresando el numero correspondiente:\n');
  printf('\t1.-Obtener expresion de la funcion transferencia.\n');
  printf('\t2.-Indicar polos.\n');
  printf('\t3.-Indicar ceros.\n');
  printf('\t4.-Marcar ganancia de la funcion.\n');
  printf('\t5.-Obtener expresion con sus polos, ceros y ganancia.\n');
  printf('\t6.-Mostrar graficamente la distribucion de polos y ceros.\n');
  printf('\t7.-Indicar estabilidad del sistema.\n');
  printf('\t8.-Obtener informe completo.\n');
  printf('\t9.-Ingresar una nueva funcion.\n');
  printf('\t10.-Finalizar.\n');
endfunction

# Procesar funcionalidades
function ret = menuDeInformacion
  enEjecucion=1; # Cuando el usuario quiera finalizar, se baja este flag
  opcion=0;
  ret=0;
  mostrarMenuDeInformacion
  while(enEjecucion)
    opcion = input('');
    switch(opcion)
    case 1
      getExpresion 
    case 2
      getPolos
    case 3
      getCeros
    case 4
      getGanancia
    case 5
      getExprCerosPolosGan
    case 6
      getGrafico
    case 7
      getEstabilidad
    case 8
      getAll
    case 9
      # Cualquier num != 0 para poder ingresar una nueva funcion
      ret=9;
      enEjecucion=0;
    case 10
      ret=0;
      enEjecucion=0;
    otherwise
      printf('Opcion invalida. Intentar nuevamente\n');
    endswitch
  endwhile
endfunction

# Menu luego de ingresar la funcion
function ret = seleccionarTodasOAlgunaCaract
  opcion=0;
  ret=0;
  while(opcion!=1 && opcion!=2)
    printf('Seleccione una opcion ingresando el numero correspondiente:\n');
    printf('\t1.-Obtener todas las caracteristicas de la funcion.\n');
    printf('\t2.-Seleccionar alguna caracteristica en particular.\n');
    opcion = input('');
    if(opcion==1)
      getAll
    elseif(opcion==2)
      ret=menuDeInformacion;
    else 
      printf('Opcion invalida. Intentar nuevamente\n');
    endif
  endwhile
endfunction

# Funcion principal
function procesadorDeFunciones
  opcion = 0;
  ret=1;
  while(ret!=0)
    # Menu principal
    printf('Seleccione una opcion ingresando el numero correspondiente:\n');
    printf('\t1.-Ingresar polinomios de la funcion transferencia.\n');
    printf('\t2.-Ingresar ceros, polos y ganancia.\n');
    printf('\t3.-Ingresar polinomios de la funcion transferencia.\n');
    opcion = input('');
    # El usuario ingresa la funcion
    funcionCorrecta=0; # Flag que levanta el usuario cuando confirma que la funcion es correcta
    if(opcion==1)
      # Ingresa numerador
      printf('Ingrese coeficientes del numerador (formato: [1,2,3] -> s^2+2s+3): ');
      numerador = input('');
      # Ingresa denominador
      printf('Ingrese coeficientes del denominador (formato: [1,2,3] -> s^2+2s+3): ');
      denominador = input('');
      # Creo la funcion transferencia
      setFuncionTransferencia(tf(numerador,denominador));
      ret=seleccionarTodasOAlgunaCaract;
    elseif(opcion==2)
      # Ingresa ceros
      ceros = input('Ingrese los ceros (formato: [1,2,3]): ');
      # Ingresa polos
      polos = input('Ingrese los polos (formato: [1,2,3]): ');
      # Ingresa ganancia
      ganancia = input('Ingrese la ganancia: ');
      # Obtengo la funcion transferencia
      setFuncionTransferencia(zpk(ceros,polos,ganancia));
      ret=seleccionarTodasOAlgunaCaract;
    elseif(opcion==3)
      # permite 's' como variables para la funcion de transferencia
      s=tf('s');
      # Ingresa Funcion transferencia
      G = input('Ingresar funcion de transferencia (Ej: (s-4)/(4-s)):');
      # Obtengo la funcion transferencia
      setFuncionTransferencia(G);
      ret=seleccionarTodasOAlgunaCaract;
    elseif
          printf('Opcion invalida. Intentar nuevamente\n');
    endif
  endwhile
endfunction

# Ejecutar el programa principal 
procesadorDeFunciones