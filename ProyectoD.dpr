program ProyectoD; //Nombre del proyecto

{$APPTYPE CONSOLE}

uses //Librerias a utilizar 
  SysUtils, crt; //Nombre de librerias

var //Variables 
//Primero es el nombre de la variable y el siguiente es el tipo de dato
 op:integer;
 opsb: integer;
 z,a,b,c:integer;
 i:Byte;
 Texto:Array[1..20] of String;


Procedure ActivaColores(ColorFondo, ColorTexto:Byte); //Activacion de colores
  begin
    TextColor(ColorTexto);           // Define el color de Texto
    TextBackGround(ColorFondo);     // Define el color del Fondo
  end;


Procedure UbicaTexto(x,y,ColorFondo,ColorTexto:Byte; Texto:String); //Ubicar textos
  Begin
     ActivaColores(ColorFondo,ColorTexto);
     GotoXY(x,y);
     Write(Texto);
     ActivaColores(0,7);   // Colores Originales
  End;

Procedure CentraTexto(y,ColorFondo,ColorTexto:Byte;Texto:String); //Centrar el texto
  Var
    x : Byte;
  Begin
     ActivaColores(ColorFondo,ColorTexto);
     x:=40-(Length(Texto) div 2);
     GotoXY(x,y);
     Write(Texto);
     ActivaColores(0,7);   // Colores Originales
  End;

Procedure CuadroHueco(xi,yi,xf,yf,ColorFondo,ColorTexto:Byte);
 Var
   i : Byte;
  begin
     UbicaTexto(xi,yi,ColorFondo,ColorTexto,'+');
     UbicaTexto(xf,yi,ColorFondo,ColorTexto,'+');
     UbicaTexto(xi,yf,ColorFondo,ColorTexto,'+');
     UbicaTexto(xf,yf,ColorFondo,ColorTexto,'+');
     for i :=xi+1  to xf-1  do
       Begin
          UbicaTexto(i,yi,ColorFondo,ColorTexto,':');
          UbicaTexto(xf,i,ColorFondo,ColorTexto,':');
       End;
  end;

Function Selector(x,y,CFondo,CTexto,FMarcado,TMarcado,NoOpciones:Byte):Byte; //Selector del texto
      //Coordenada horizontal, coordenada vertical, Color de fondo, color de texto
  Var
    i,Opcion : Byte;
    Tecla    : Char;
  Begin
     Opcion:=1;
     for i:=1 to NoOpciones do
       UbicaTexto(x,y+i,CFondo,CTexto,Texto[i]);
     Repeat
         UbicaTexto(x,y+Opcion,FMarcado,Tmarcado,Texto[Opcion]);
         Tecla:=Readkey;
         case Tecla of
            #0 : Begin  // Codigo Extendido
                    Tecla:=Readkey;   // Se bota el segundo codigo
                    case Tecla of
                       #80 : Begin  // Flecha Abajo
                                UbicaTexto(x,y+Opcion,CFondo,CTexto,Texto[Opcion]);
                                if Opcion<NoOpciones then Inc(Opcion)
                                else Opcion:=1;
                             End;
                       #72 : Begin  // Flecha Arriba
                                UbicaTexto(x,y+Opcion,CFondo,CTexto,Texto[Opcion]);
                                if Opcion>1 Then Dec(Opcion)
                                else Opcion:=NoOpciones;
                             End;
                    end;
                 End;
            Else
                 Begin  // Codigo Normal
                 End;
         end;
     Until (Tecla=#13);
     Selector:=Opcion;
  End;

procedure chicharronera; //Menu de Ecuacion cuadratica
var //Variables 
//Primero es el nombre de la variable y el siguiente es el tipo de dato

opsb: integer;
opcion : char;
v : integer;
a, b, c: integer;
x1, x2 : real;
par1, par2, par3: integer;
pd: single;
       begin  //bloque de instrucciones
       ActivaColores(12,1); //activacion de colores 
          repeat  //la operacion se repetira
          //Menu de la pantalla
          Texto[1]:='Continuar';
          Texto[2]:='Regresar al menu principal';

          opsb:=Selector(10,18,7,4,0,15,2);

            //Inicia el Case
          case opsb of
          1: begin
  Clrscr;
  repeat //la operacion se repetira
  Clrscr;
  // Almacenamiento de datos
  writeln('PROGRAMA PARA CALCULAR LA ECUACION CUADRATICA');
  writeln('');
  write('Ingresa el valor de A: ');
  readln(a); //Se leen los datos y se guardan
  write('Ingresa el valor de B: ');
  readln(b); //Se leen los datos y se guardan
  write('Ingresa el valor de C: ');
  readln(c); //Se leen los datos y se guardan
  //Operaciones
  par1:= b*-1;
  par2:= ((b*b)+(-4*a*c));
  par3:= 2*a;
  //Condicion IF
  if par2<=-1 then
  begin //bloque de instrucciones
  writeln('');
  writeln('No se puede calcular debido a que la raiz es negativa');
  writeln('Por lo tanto no tiene solucion');
  end //Fin del bloque de instrucciones
  //Si no ocurre lo primero pasara a lo siguiente
  else

  begin//bloque de instrucciones
  writeln('');
  write('Ingresa la raiz de ' ,par2,' : ');
  readln(pd); //Se leen los datos y se guardan
  //Operaciones
  x1:=(par1+pd)/par3;

  x2:=(par1-pd)/par3;
  //Resultados
  writeln('El valor de x positiva es: ', x1);
  writeln('el valor de x negativa es: ', x2);

  end;  //Repetir el programa
          writeln('');
          writeln('Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0; //Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of
      2:begin //Inicia del segundo Case
          clrscr;
          writeln;
          end; //Fin del bloque de instrucciones
       end; //Fin del bloque de instrucciones
       until opsb = 2;  //Se lee la desicion
        end; //Fin del bloque de instrucciones

procedure menu1;  
var //Variables 
//Primero es el nombre de la variable y el siguiente es el tipo de dato

 opsb:integer;
 opcion:char;
 v:char;
 baseM, base, altura, l1, l2, l3, l4, apotema: real;
 t:real;
 dia,diaM:real;
 r:real;
 d:real;
 a:real;
 p:real;
 dato:char;

begin //bloque de instrucciones
 ActivaColores(12,1);
          repeat //la operacion se repetira
          Texto[1]:='Circulo';
          Texto[2]:='Triangulo';
          Texto[3]:='Trapecio';
          Texto[4]:='Rombo';
          Texto[5]:='Estrella';
          Texto[6]:='Elipse';
          Texto[7]:='Regresar al menu';

          opsb:=Selector(10,18,7,4,0,15,7);

          case opsb of
          1:begin //bloque de instrucciones
          Clrscr;
          repeat //la operacion se repetira
          Clrscr;   // Almacenamiento de datos
         writeln('CALCULAR AREA Y PERIMETRO DE UN CIRCULO');
         writeln('**Esto mediante el diametro o radio**');
         writeln ('Escribe d para calcular mediante el diametro');
         writeln ('Escribe r para calcular mediante el radio');
         readln (v); //Se leen los datos y se guardan
  if v ='d' then
  begin //bloque de instrucciones
   writeln(' escribe el valor del diametro');
   readln(D); //Se leen los datos y se guardan
   A:=(3.1416)*((d*d)/4);
   P:=(3.1416*d);
   end //Fin del bloque de instrucciones

  else
  begin //bloque de instrucciones
  writeln('ingrese el valor de tu radio');
  readln(r); //Se leen los datos y se guardan
  writeln;
  A:=(3.1416)*sqr(r);
  writeln;
  P:=(2*3.1416)*(r);
  end; //Fin del bloque de instrucciones

  writeln('el resultado del area es: ', a:0:4);
  writeln('el resultado del perimetro es: ', p:0:4);
  writeln;
  writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0;//Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of


          2:begin //bloque de instrucciones
         Clrscr;
           repeat //la operacion se repetira
           Clrscr;

      writeln(' CALCULO DE AREA Y PERIMETRO DEL TRIANGULO ');
      writeln;
      writeln('Selecciona una opcion');
      writeln('');
      writeln('Escribe a para calcular el area');
      WRITELN('Escribe p para calcular el perimetro');
      writeln;

      readln(v); //Se leen los datos y se guardan

     if v='a' then
     begin //bloque de instrucciones
       write('Escribe el valor de la base : ');
       readln(base);
       write('Escribe el valor de la altura: ');
       readln(altura);
       a :=base*altura/2;
     end //Fin del bloque de instrucciones

     else
     begin //bloque de instrucciones
      write('Escribe el valor de la base: ');
      readln(base); //Se leen los datos y se guardan
      write('Escribe el valor de lado 1 : ');
      readln(l1); //Se leen los datos y se guardan
      write('Escribe el valor de lado 2: ');
      readln(l2); //Se leen los datos y se guardan
      p := l1+l2+base;

      end; //Fin del bloque de instrucciones
         writeln('el resultado del area es: ', a:0:4);
         writeln;
         writeln('el resultado del perimetro es: ', p:0:4);

         writeln('�Quieres repetir el programa?');
         writeln('Coloca 1 si quieres repetir el programa');
         writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0;//Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of

        3:begin //bloque de instrucciones
        Clrscr;
        repeat //la operacion se repetira
        Clrscr;

      writeln(' CALCULO DE AREA Y PERIMETRO DEL TRAPECIO ');
      writeln;
      writeln('Escribe a para calcular el area');
      WRITELN('Escribe p para calcular el perimetro');

      readln(v); //Se leen los datos y se guardan

     if v='a' then
     begin //bloque de instrucciones
       write('Escribe el valor de la base mayor : ');
       readln(base);
       write('Escribe el valor de la base menor: ');
       readln(baseM);	
       write('Escribe el valor de la altura: ');
       readln(altura);
       a :=((base+baseM)/2)*altura;
     end //Fin del bloque de instrucciones

     else

     begin //bloque de instrucciones
      write('Escribe el valor de la base mayor: ');
      readln(base); //Se leen los datos y se guardan
      write('Escribe el valor de la base menor: ');
      readln(baseM); //Se leen los datos y se guardan
      write('Escribe el valor de lado 1 : ');
      readln(l1); //Se leen los datos y se guardan
      write('Escribe el valor de lado 2: ');
      readln(l2); //Se leen los datos y se guardan
      p := l1+l2+base+baseM; //Operaciones

      end; //Fin del bloque de instrucciones
      //Resultados
         writeln('el resultado del area es: ', a:0:4);
         writeln;
         writeln('el resultado del perimetro es: ', p:0:4);

          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0; //Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of

          4:begin //bloque de instrucciones
          Clrscr;  
           repeat //la operacion se repetira
           Clrscr;

      writeln(' CALCULO DE AREA Y PERIMETRO DEL ROMBO ');
      writeln;
      writeln('Escribe a para calcular el area');
      WRITELN('Escribe p para calcular el perimetro');

      readln(v); //Se leen los datos y se guardan

     if v='a' then
     begin //bloque de instrucciones
       write('Escribe el valor de la diagonal mayor : ');
       readln(dia); //Se leen los datos y se guardan
       write('Escribe el valor de la diagonal menor: ');
       readln(diaM); //Se leen los datos y se guardan
       a :=(dia*diaM)/2;
     end //Fin del bloque de instrucciones

     else

     begin //bloque de instrucciones
      
      write('Escribe el valor de lado 1 : ');
      readln(l1); //Se leen los datos y se guardan
      write('Escribe el valor de lado 2: ');
      readln(l2); //Se leen los datos y se guardan
      write('Escribe el valor de lado 3: ');
      readln(l3); //Se leen los datos y se guardan
      write('Escribe el valor de lado 4: ');
      readln(l4); //Se leen los datos y se guardan
      //Operaciones
      p := l1+l2+l3+l4;

      end; //Fin del bloque de instrucciones
      //Se muestran los resultados
         writeln('el resultado del area es: ', a:0:4);
         writeln;
         writeln('el resultado del perimetro es: ', p:0:4);

          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0; //Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of


          5:begin //bloque de instrucciones
          Clrscr;  
           repeat //la operacion se repetira
           Clrscr;

      writeln(' CALCULO DE AREA Y PERIMETRO DE UNA ESTRELLA DE DAVID ');
      writeln;
      writeln('Escribe a para calcular el area');
      WRITELN('Escribe p para calcular el perimetro');

      readln(v); //Se leen los datos y se guardan

     if v='a' then
     begin //bloque de instrucciones
       write('Escribe el valor uno de los triangulos: ');
       readln(t);
       write('Escribe la raiz cuadrada de  ' , t, ':');
       readln(r);
       a :=(((t*t)*12)/2)*r;
     end //Fin del bloque de instrucciones

     else

     begin //bloque de instrucciones
      
      write('Escribe el valor de uno de los lados : ');
      readln(l1); //Se leen los datos y se guardan
      //Operaciones
      p := l1*12;

      end; //Fin del bloque de instrucciones
         writeln('el resultado del area es: ', a:0:4);
         writeln;
         writeln('el resultado del perimetro es: ', p:0:4);

          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0; //Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of

          6:begin //bloque de instrucciones
          Clrscr;  
           repeat //la operacion se repetira
           Clrscr;

      writeln(' CALCULO DE AREA Y PERIMETRO DE UNA ELIPSE ');
      writeln;
      writeln('Escribe a para calcular el area');
      WRITELN('Escribe p para calcular el perimetro');

      readln(v); //Se leen los datos y se guardan

     if v='a' then
     begin //bloque de instrucciones
       write('Escribe el valor de a: ');
       readln(base); //Se leen los datos y se guardan
       write('Escribe el valor de b: ');
       readln(altura); //Se leen los datos y se guardan
      //Operaciones
       a :=base*altura*3.1416;
     end //Fin del bloque de instrucciones

     else

     begin //bloque de instrucciones
      
      write('Escribe el valor de a: ');
      readln(altura); //Se leen los datos y se guardan
      write('Escribe el valor de b: ');
      readln(base); //Se leen los datos y se guardan
      r:=((altura* altura)+(base*base))/2;
      write('Escribe la raiz de' ,r, ' : '  );
      readln(r); //Se leen los datos y se guardan
      //Operaciones
      p :=(r*3.1416)*2;

      end; //Fin del bloque de instrucciones
         writeln('el resultado del area es: ', a:0:4);
         writeln;
         writeln('el resultado del perimetro aproximado es de: ', p:0:4);

          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(op); //Se leen los datos y se guardan
          until op=0; //Se regresa al menu
            end; //Fin del bloque de instrucciones
          end; //Fin del bloque de instrucciones
      case opsb of


          7:begin //bloque de instrucciones
          clrscr;
          writeln;
          end; //Fin del bloque de instrucciones
       end; //Fin del bloque de instrucciones
       until opsb = 7; //Se regresa al menu al seleccionar esta opcion
        end; //Fin del bloque de instrucciones

procedure menu2;
var //Variables 
//Primero es el nombre de la variable y el siguiente es el tipo de dato

 Nt:integer;
 k:byte;
 Xsuma:real;
 Xmed:real;
 i:byte;
 lista:array [0..250] of real;
 n:real;
 opcion:char;
 menor:real;
 mayor:real;
 opsb:integer;
 Datofinal:integer;
 Altura:Array[1..100] of integer;
 Aux:integer;
 Respueta:byte;

begin //bloque de instrucciones
     ActivaColores(12,0);
         repeat //la operacion se repetira
          Texto[1]:='Encontrar el numero mayor';
          Texto[2]:='Encontrar el numero menor';
          Texto[3]:='Realizar una suma';
          Texto[4]:='Sacar el promedio';
          Texto[5]:='Regresar al menu';

          opsb:=Selector(10,18,7,4,0,15,5);

          case opsb of
          1:begin //bloque de instrucciones
          Clrscr;
          repeat //la operacion se repetira
          Clrscr;
           writeln('Programa para encontar el numero mayor');
           writeln;
           writeln('�Cuantos numeros se compararan?:  ');
             readln(n); //Se leen los datos y se guardan
             i:=0;

            repeat //la operacion se repetira
             i:=i+1;
             writeln('escribe el (',i,') : ');
             readln(lista[i]); //Se leen los datos y se guardan
             until i=n;

                i:=0;
             mayor:=-100;
                repeat //la operacion se repetira
                 i:=i+1;
                 if lista[i]>mayor then //Condicion IF
                mayor:= lista[i];  //Se leen los datos y se guardan
                 until i=n; 

                i:=0;
                  repeat //la operacion se repetira
                 i:=i+1;
                 if lista[i]<mayor then //Condicion IF
                 menor:= lista[i];  //Se leen los datos y se guardan
                     until i=n;

          writeln('el numero mayor es : ', mayor :0:3);
          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(opsb); //Se leen los datos y se guardan
          until opsb=0;

                end; //Fin del bloque de instrucciones
             end; //Fin del bloque de instrucciones
        case opsb of
          2:begin //bloque de instrucciones
          Clrscr;
          repeat //la operacion se repetira
          Clrscr;
           writeln('Programa para encontar el numero menor');
           writeln;
           writeln('�Cuantos numeros se compararan?:  ');
             readln(n); //Se leen los datos y se guardan
             i:=0;

            repeat //la operacion se repetira
             i:=i+1;
             writeln('escribe el (',i,') : ');
             readln(lista[i]); //Se leen los datos y se guardan
             until i=n;

                i:=0;
             mayor:=-100;
                repeat //la operacion se repetira
                 i:=i+1;
                 if lista[i]>mayor then //Conficional IF
                mayor:= lista[i]; //Se leen los datos y se guardan
                 until i=n;

                i:=0;
                  repeat //la operacion se repetira
                 i:=i+1;
                 if lista[i]<mayor then //Condicional IF
                 menor:= lista[i]; //Se leen los datos y se guardan
                     until i=n;
                //Se muestran los resultados
                writeln('el numero mayor es : ', menor :0:3);


                writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(opsb); //Se leen los datos y se guardan
          until opsb=0;//Se regresa al menu

                end; //Fin del bloque de instrucciones
               end; //Fin del bloque de instrucciones
            case opsb of

          3:begin //bloque de instrucciones
          Clrscr;
          repeat //la operacion se repetira
          Clrscr;

          writeln('Suma de numeros');
     writeln('Indica el numero total de datos: ');
     readln(Nt); //Se leen los datos y se guardan


     k :=0;
     repeat //la operacion se repetira
        k:= k +1 ;
        writeln('Ingrese el numero (',k, '):  ');
        readln(Lista[k]); //Se leen los datos y se guardan
      until K=Nt;


      Xsuma:=0;
      k:=0;

      repeat //la operacion se repetira
      //Operaciones
         k := k+1;
         Xsuma:=Xsuma+Lista[k];

       until k=Nt;
        //operaciones
       Xmed:=Xsuma;


       writeln;
       writeln('La suma del conjunto de datos es de: ', Xmed:0:4);

          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(opsb); //Se leen los datos y se guardan
          until opsb=0;//Se regresa al menu
          end; //Fin del bloque de instrucciones
        end; //Fin del bloque de instrucciones
     case opsb of
        

          4:begin //bloque de instrucciones
          Clrscr;
          repeat //la operacion se repetira
          Clrscr;

          writeln('Calcular la media aritmetica y suma de numeros');
     writeln('Indica el numero total de datos: ');
     readln(Nt); //Se leen los datos y se guardan


     k :=0;
     repeat //la operacion se repetira
        k:= k +1 ;
        writeln('Ingrese el numero (',k, '):  ');
        readln(Lista[k]); //Se leen los datos y se guardan
      until K=Nt;


      //procedimiento de suma
      //Operaciones
      Xsuma:=0;
      k:=0;

      repeat //la operacion se repetira
      //operaciones
         k := k+1;
         Xsuma:=Xsuma+lista[k];

       until k=Nt;
        //Operaciones
       Xmed:=Xsuma/Nt;

      

       writeln;
       writeln('La media aritmetica del conjunto de datos es: ', Xmed:0:4);
       writeln;
       writeln;
       writeln('La suma de los datos es: 5');
       writeln;

          writeln('�Quieres repetir el programa?');
          writeln('Coloca 1 si quieres repetir el programa');
          writeln('Coloca 0 si quieres volver al menu');
          readln(opsb); //Se leen los datos y se guardan
          until opsb=0;//Se regresa al menu
          end; //Fin del bloque de instrucciones
        end; //Fin del bloque de instrucciones
     case opsb of

          5:begin //bloque de instrucciones
          clrscr;
          writeln;
          end;
       end; //Fin del bloque de instrucciones
       until opsb = 5;//Se regresa al menu al invocar el numero elegido
        end; //Fin del bloque de instrucciones


procedure portada; 

begin //bloque de instrucciones
      Clrscr;
     repeat //la operacion se repetira
  Centratexto(2,12,14,'UNIVERSIDAD DEL BIENESTAR "BENITO JUAREZ"');
  centratexto(4,12,14,'MATERIA PROGRAMACION B�SICA');
  UbicaTexto(30,8,12,14,'Integrantes del Equipo:');
  UbicaTexto(30,10,12,14,' Barragan Hernandez Clara');
  UbicaTexto(27,11,12,14,' Nava Hernandez Jessica Jazmin');
  UbicaTexto(26,12,12,14,' Sanchez viveros Ivonne Guadalupe');

  Centratexto(14,12,14,'MENU PRINCIPAL');
  Centratexto(16,12,14,'Selecciona una opcion: ');
                                   // alt+91 [      Alt+93 ]
  Texto[1]:='Variables Simples';
  Texto[2]:='Variables Complejas';
  Texto[3]:='Ecuacion Cuadratica';
  Texto[4]:='Salir del programa';
  op:=Selector(10,18,7,4,0,15,4);


    case op of
        1:begin //bloque de instrucciones
        Clrscr;
        menu1; //Se invoca la clase 
         end; //Fin del bloque de instrucciones

        2:begin //bloque de instrucciones
         Clrscr;
        menu2; //Se invoca la clase 
      end; //Fin del bloque de instrucciones

        3:begin //bloque de instrucciones
        Clrscr;
        chicharronera; //Se invoca la clase

        end;  //Fin del bloque de instrucciones
      end; //Fin del bloque de instrucciones
      until op=4;
 end; //Fin del bloque de instrucciones

begin //bloque de instrucciones
 //programa principal
 ActivaColores(3,0);
 portada; //Se invoca la clase 
end. //Fin del bloque de instrucciones

