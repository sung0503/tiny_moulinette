#include <stdio.h>

#define ARR_LEN 9

int ft_recursive_power(int nb, int power);

int main()
{
    int arr[ARR_LEN] = {0,
                        -2147483648,
                        -5,
                        -1,
                        1,
                        2,
                        3,
                        4,
                        5};

    for (int i = 0; i < ARR_LEN; i++)
    {
        printf("%d\n", ft_recursive_power(arr[i], i));
    }
    printf("%d\n", ft_recursive_power(arr[2], -2));
    return 0;
}