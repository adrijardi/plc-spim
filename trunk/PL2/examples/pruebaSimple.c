#include <stdio.h>

int prod = 2;
int y = 10;

int main(){  
 int y = 3;
 int f2;
 prod = 5;
 
 printf("%s","prod=");
 printf("%d\n",prod);
 printf("%s","y=");
 printf("%d\n",y);

 printf("%s","Invoco a f1\n");
 f1();
 
 printf("%s","Invoco a f2 con resultado: ");
 f2 = f2();
 printf("%d\n",f2);
 
 printf("%s","Saliendo...\n");
 return 0;
}

void f1(){  
 printf("%s","y(global)=");
 printf("%d\n",y);
}

int f2(){
	return 42; 
}
