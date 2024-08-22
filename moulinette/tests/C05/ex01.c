#include <stdio.h>

#define ARR_LEN 16

int ft_recursive_factorial(int nb);

int main()
{
    int arr[ARR_LEN] = {-2147483648,
                        -5,
                        -1,
                        0,
                        1,
                        2,
                        3,
                        4,
                        5,
                        6,
                        7,
                        8,
                        9,
                        10,
                        11,
                        12};

    for (int i = 0; i < ARR_LEN; i++)
    {
        printf("%d\n", ft_recursive_factorial(arr[i]));
    }
    return 0;
}
