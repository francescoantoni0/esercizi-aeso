#include <stdio.h>

extern unsigned int conta(unsigned int n);

int main(int argc, char const *argv[])
{
    if (argc != 2){
        return 1;
    }

    conta(atoi(argv[1])) == 1 ?
        printf("Il numero è una potenza di 2!\n") :
        printf("Il numero NON è una potenza di 2!\n");

    return 0;
}
