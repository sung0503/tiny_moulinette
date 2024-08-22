#include <stdio.h>

int	ft_atoi(char *str);

int main(void)
{
    printf("%d\n", ft_atoi("1234"));
    printf("%d\n", ft_atoi(" 1234"));
    printf("%d\n", ft_atoi("  1234"));
    printf("%d\n", ft_atoi("   1234"));
    printf("%d\n", ft_atoi("    1234"));
    printf("%d\n", ft_atoi("    \t\n\v\f\r 1234"));
    printf("%d\n", ft_atoi("    \t\n\v\f\r -+--++-+++--++------+++1234"));
    printf("%d\n", ft_atoi("-2147483648"));
    printf("%d\n", ft_atoi("--2147483647"));
    printf("%d\n", ft_atoi("-+1234a5678"));
    printf("%d\n", ft_atoi("-+1234 \t\n\v\f\r5678"));
    printf("%d\n", ft_atoi("-+1234-5678"));
    printf("%d\n", ft_atoi("-+1234+5678"));
    printf("%d\n", ft_atoi("-+1234--5678"));
    printf("%d\n", ft_atoi("-+1234-+5678"));
    return 0;
}
