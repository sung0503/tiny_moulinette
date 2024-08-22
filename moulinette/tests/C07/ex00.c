#include <stdio.h>

char *ft_strdup(char *src);

int main(void)
{
    printf("%s\n", ft_strdup("Hello World!"));
    printf("%s\n", ft_strdup("Hello 42 Gyeongsan"));
    return 0;
}
