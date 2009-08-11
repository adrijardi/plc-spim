#include <stdio.h>

int main(){
 char a = 'a';
 char b = 'b';
 a = 'b';
 a = a + 2;
 b = 'a' + 'b';
 b = 3;

 printf("%c", a);
 printf("%c", b);
 return 0;
}
