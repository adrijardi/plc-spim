#include <stdio.h>

int prod = 2;
int y = 10;
float fp1 = 3.5f;
float fp2 = 6.3f;
float fp3 = 4.3f;

void f1(){  
 printf("%s","y(global)=");
 printf("%d\n",y);
 printf("%s","fp1(global)=");
 printf("%f\n",fp1);
}

int f2(){
	return 42;
}

float f2f(){
	return 42.99f;
}

int f3(){
	return y;
}

float f3f(){
	return fp2;
}

void f4(int z, int c, int f){
	printf("%d\n",z);
	printf("%d\n",c);
	printf("%d\n",f);
}

int f5(int z){
	return z;
}

float f5f(float z){
	return z;
}

void pruebaFunciones(){
 int y = 3;
 int iret;
 float fret;
 prod = 5;
 
 printf("%s","prod=");
 printf("%d\n",prod);
 printf("%s","y=");
 printf("%d\n",y);

 printf("%s","Invocacion vacia f1\n");
 f1();
 
 printf("%s","Invocacion vacia con retorno constante[int] f2\n");
 iret = f2();
 printf("%d\n",iret);
 
 printf("%s","Invocacion vacia con retorno constante[float] f2f\n");
 fret = f2f();
 printf("%f\n",fret);
 
 printf("%s","Invocacion vacia con retorno variable[int] f3\n");
 iret = f3();
 printf("%d\n",iret);
 
 printf("%s","Invocacion vacia con retorno variable[float] f3f\n");
 fret = f3f();
 printf("%f\n",fret);
 
 printf("%s","Invocacion con parametros constantes[int, int, int] f4\n");
 f4(1,2,3);
 
 printf("%s","Invocacion con parametros constantes y retorno [int] f5\n");
 iret = f5(10);
 printf("%d\n",iret);
 
 printf("%s","Invocacion con parametros constantes (conversion int -> float) y retorno [int] f5f\n");
 fret = f5f(10);
 printf("%f\n",fret);
 
 printf("%s","Invocacion con parametros constantes (conversion float -> int) y retorno [int] f5\n");
 iret = f5(10.5f);
 printf("%d\n",iret);
 
 printf("%s","Invocacion con parametros variables y retorno [int] f5\n");
 iret = f5(prod);
 printf("%d\n",iret);
 
 printf("%s","Invocacion con parametros variables y retorno [int] f5f\n");
 printf("%f\n",fp1);
 fret = f5f(fp1);
 printf("%f\n",fret);
 
 printf("%s","Invocacion con parametros variables (conversion int -> float) y retorno [int] f5f\n");
 fret = f5f(prod);
 printf("%f\n",fret);
 
 printf("%s","Invocacion con parametros variables (conversion float -> int) y retorno [int] f5\n");
 printf("%f\n",fp3);
 iret = f5(fp3);
 printf("%d\n",iret);
 
 printf("%s","Conversion de asignacion en retorno (conversion float -> int) f5f\n");
 iret = f5f(prod);
 printf("%d\n",iret);
 
 printf("%s","Conversion de asignacion en retorno (conversion int -> float) f5\n");
 printf("%f\n",fp3);
 fret = f5(fp3);
 printf("%f\n",fret);
}

void pruebaOperaciones(){
 int i = 1;
 float j = 0;
 printf("%s","Asignaciones con operacion [+=]\n");
 printf("%d\n",i);
 i += 1;
 printf("%d\n",i);
 i += 1.6f;
 printf("%d\n",i);
 j += i;
 printf("%f\n",j);
 j += 1;
 printf("%f\n",j);
 j += 1.5f;
 printf("%f\n",j);
 j += 3 + 1.5f;
 printf("%f\n",j);
 printf("%s","Asignaciones con operacion [-=]\n");
 printf("%d\n",i);
 i -= 4;
 printf("%d\n",i);
 i -= 1.6f;
 printf("%d\n",i);
 j -= i;
 printf("%f\n",j);
 j -= 1;
 printf("%f\n",j);
 j -= 1.5f;
 printf("%f\n",j);
 j -= 3 + 1.5f;
 printf("%f\n",j);
 printf("%s","Asignaciones con operacion [*=]\n");
 printf("%d\n",i);
 i *= 4;
 printf("%d\n",i);
 i *= 1.6f;
 printf("%d\n",i);
 j *= i;
 printf("%f\n",j);
 j *= 1;
 printf("%f\n",j);
 j *= 1.5f;
 printf("%f\n",j);
 j *= 3 + 1.5f;
 printf("%f\n",j);
 printf("%s","Asignaciones con operacion [/=]\n");
 printf("%d\n",i);
 i /= 4;
 printf("%d\n",i);
 i /= 1.6f;
 printf("%d\n",i);
 j /= i;
 printf("%f\n",j);
 j /= 1;
 printf("%f\n",j);
 j /= 1.5f;
 printf("%f\n",j);
 j /= 3 + 1.5f;
 printf("%f\n",j);
 printf("%s","Pruebas de precedencia sin parentesis almacenano en entero [4+2*3/4]\n");
 i = 4+2*3/4;
 printf("%d\n",i);
 printf("%s","Pruebas de precedencia sin parentesis almacenano en float [1*2+3/4]\n");
 j = 1*2+3/4;
 printf("%f\n",j);
 printf("%s","Pruebas de precedencia sin parentesis almacenano en entero [1+2*3-4.0]\n");
 i = 1+2*3-4.0f;
 printf("%d\n",i);
 printf("%s","Pruebas de precedencia sin parentesis almacenano en float [1-6*3/4.0]\n");
 j = 1-6*3/4.0f;
 printf("%f\n",j);
 printf("%s","Pruebas de precedencia con parentesis almacenano en entero [((4+2)*3)/4]\n");
 i = ((4+2)*3)/4;
 printf("%d\n",i);
 printf("%s","Pruebas de precedencia con parentesis almacenano en float [1*(2+3)/4]\n");
 j = 1*(2+3)/4;
 printf("%f\n",j);
 printf("%s","Pruebas de precedencia con parentesis almacenano en entero [(1+2)*(3-4.0)]\n");
 i = (1+2)*(3-4.0f);
 printf("%d\n",i);
 printf("%s","Pruebas de precedencia con parentesis almacenano en float [(1-6)*3/4.0]\n");
 j = (1-6)*3/4.0f;
 printf("%f\n",j);
 
 printf("%s","Pruebas constantes int operaciones logicas [1==2]\n");
 i = 1==2;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [1==1]\n");
 i = 1==1;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [1!=2]\n");
 i = 1!=2;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [1!=1]\n");
 i = 1!=1;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [1==2.4]\n");
 i = 1==2.4f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [1.1==1.1]\n");
 i = 1.1f==1.1f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [2.4!=2.0]\n");
 i = 2.4f!=2.0f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [1.0!=1.0]\n");
 i = 1.0f!=1.0f;
 printf("%d\n",i);
 
 printf("%s","Pruebas constantes int operaciones logicas [1<=2]\n");
 i = 1<=2;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [1>=1]\n");
 i = 1>=1;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [1<2]\n");
 i = 1<2;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [1>1]\n");
 i = 1>1;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [1<=2.4]\n");
 i = 1<=2.4f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [1.1>=1.1]\n");
 i = 1.1f>=1.1f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [2.4<2.0]\n");
 i = 2.4f<2.0f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [1.0>1.0]\n");
 i = 1.0f>1.0f;
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [(1<2)&&(2>1)]\n");
 i = (1<2)&&(2>1);
 printf("%d\n",i);
 printf("%s","Pruebas constantes int operaciones logicas [(1>2)||(2>1)]\n");
 i = (1>2)||(2>1);
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [(1<=2.4f)&&(1>=2)]\n");
 i = (1<=2.4f)&&(1>=2);
 printf("%d\n",i);
 printf("%s","Pruebas constantes float operaciones logicas [(1>=2)||(1<=2.4f)]\n");
 i = (1>=2)||(1<=2.4f);
 printf("%d\n",i);
}

void pruebaSentenciasControl(){
 printf("%s","Prueba if [1<2]\n");
 if(1<2){
	printf("%s"," 1 es menor que 2\n");
 }
 
 printf("%s","Prueba if [2<1]\n");
 if(2<1){
	printf("%s"," 2 es menor que 1\n");
 }else{
 	printf("%s"," 2 no es menor que 1\n");
 }
}

int main(){  
 printf("%s","Pruebas funciones\n");
 pruebaFunciones();
 
 printf("%s","Pruebas Operaciones\n");
 pruebaOperaciones();
 
 printf("%s","Pruebas Sentencias Control\n");
 pruebaSentenciasControl();
 
 printf("%s","Saliendo...\n");
 return 0;
}
