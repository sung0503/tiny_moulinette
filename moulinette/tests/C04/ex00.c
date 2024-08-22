#include <stdio.h>

int ft_strlen(char *str);

int main(void)
{
    printf("%d\n", ft_strlen(""));
    printf("%d\n", ft_strlen("\n"));
    printf("%d\n", ft_strlen("1234\n"));
    printf("%d\n", ft_strlen("Hello 42 Gyeongsan So Hot Place.\n"));
    return 0;
}
