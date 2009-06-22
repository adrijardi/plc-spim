#include <stdio.h>

int prod = 2;
int y = 10;

void f1(){  
 printf("%s","y(global)=");
 printf("%d\n",y);
}

int f3(int x){
	return x;
}

int f2(int z, int c, int f){
	return 42; 
}

int main(){  
 int y = 3;
 int fd2;
 prod = 5;
 
 printf("%s","prod=");
 printf("%d\n",prod);
 printf("%s","y=");
 printf("%d\n",y);

 printf("%s","Invoco a f1\n");
 f1();
 
 printf("%s","Invoco a f2 con resultado: ");
 fd2 = f2(y, prod, 4);
 printf("%d\n",fd2);
 
 printf("%s","Invoco a f3 pasandole y, devuelve: ");
 fd2 = f3(y);
 printf("%d\n",fd2);
 
 printf("%s","Saliendo...\n");
 return 0;
}
