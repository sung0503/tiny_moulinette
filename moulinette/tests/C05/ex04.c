#include <stdio.h>

int ft_fibonacci(int index);

int main(void)
{
    for (int i = -5; i < 21; i++)
        printf("%d\n", ft_fibonacci(i));
    return 0;
}
