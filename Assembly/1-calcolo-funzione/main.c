#include <stdio.h>

extern unsigned int fun(int x);

int main(int argc, char const *argv[])
{
    if (argc != 2){
        return 0;
    }
    
    int i = atoi(argv[1]);

    printf("fun(%i) = %i\n", i, fun(i));

    return 0;
}
