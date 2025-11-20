#include <stdio.h>
#include <stdlib.h>

unsigned int cerca(unsigned int, unsigned int *, unsigned int n);

int main(int argc, char const *argv[])
{
    if (argc != 2)
        return -1;

    unsigned int n = atoi(argv[1]), v[] = {1,2,4,5,3}, nv = 5, i = cerca(n, v, nv);

    if (i == -1)
    {
        printf("Il valore %i non è stato trovato!\n", n);
        return i;
    }
        
    else if (i == -2)
    {
        perror("Errore!\n");
        return i;
    }
    else
        printf("Il valore %i è in posizione %i.\n", n, i);
    
    return 0;
}