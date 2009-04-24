#include <stdio.h>

int prod = 2;
int y = 10;

int main(){  
 int y = 3;
 prod = 5;
 
 printf("%s","prod=");
 printf("%d\n",prod);
 printf("%s","y=");
 printf("%d\n",y);

 printf("%s\n","Invoco a f1\n");
 f1();
 
 printf("%s","Saliendo...\n");
 return 0;
}

void f1(){  
 printf("%s","y(global)=");
 printf("%d\n",y);
}
