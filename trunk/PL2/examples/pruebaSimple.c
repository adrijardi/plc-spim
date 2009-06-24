#include <stdio.h>

int prod = 2;
int y = 10;
float fp1 = 3.5f;
float fp2 = 6.3f;

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

int main(){  
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
 
 printf("%s","Saliendo...\n");
 return 0;
}
