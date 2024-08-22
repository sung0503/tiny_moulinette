#include <stdio.h>

int ft_sqrt(int nb);

int main()
{
    for (int i = -4; i <= 25; i++)
        printf("%d\n", ft_sqrt(i));
    printf("%d\n", ft_sqrt(35));
    printf("%d\n", ft_sqrt(36));
    printf("%d\n", ft_sqrt(37));
    printf("%d\n", ft_sqrt(48));
    printf("%d\n", ft_sqrt(49));
    printf("%d\n", ft_sqrt(50));
    printf("%d\n", ft_sqrt(63));
    printf("%d\n", ft_sqrt(64));
    printf("%d\n", ft_sqrt(65));
    printf("%d\n", ft_sqrt(2147395600));
    return 0;
}
