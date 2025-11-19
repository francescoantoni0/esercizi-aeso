#include <stdio.h>
#include <stdlib.h>

char *s = "questa è una prova di stringa non tanto lunga scritta in italiano";

extern int* conta(char *);


int main(int argc, char const *argv[])
{
    if (argc > 2 || argc < 1) return 1;
    else if (argc == 2) s = argv[1];

    int i;

    for (i = 0; i < 25; i++){
        printf("%c\t", i+97);
    }

    printf("%c\n", i+97);

    int *v = conta(s);

    for (i = 0; i < 25; i++){
        printf("%i\t", v[i]);  
    }

    printf("%i\n", v[i]);

    return 0;
}
