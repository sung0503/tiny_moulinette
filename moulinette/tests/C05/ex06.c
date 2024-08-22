#include <stdio.h>

int ft_is_prime(int nb);

int main()
{
    for (int i = -4; i <= 10; i++)
        printf("%d\n", ft_is_prime(i));
    printf("%d\n", ft_is_prime(2147483641));
    printf("%d\n", ft_is_prime(2147483643));
    printf("%d\n", ft_is_prime(2147483645));
    printf("%d\n", ft_is_prime(2147483647));
    return 0;
}
