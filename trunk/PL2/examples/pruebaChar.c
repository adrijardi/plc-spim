#include <stdio.h>

char f;
char c[5];

void main(){
f = 'b';
c[0] = 'a';
c[1] = 'b';
f = c[0];
printf("%c",f);
f = c[1];
printf("%c",f);
}
