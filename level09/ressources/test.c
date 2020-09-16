#include <stdio.h>
#include <string.h>

int main(int ac, char **av)
{
    if (ac != 2)
        return 0;
    for (int i = 0; i < strlen(av[1]); i++)
    {
        printf("%c", av[1][i] - i);
    }
    printf("\n");
    return 0;
}