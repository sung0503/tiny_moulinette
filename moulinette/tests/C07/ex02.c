#include <stdio.h>

int ft_ultimate_range(int **range, int min, int max);

void test(int min, int max)
{
    int *arr;
    int res;
    res = ft_ultimate_range(&arr, min, max);
    if (min >= max)
    {
        if (arr != NULL || res != 0)
        {
            printf("Expected NULL & 0 but not NULL or not 0.\n");
            return;
        }
        else
        {
            printf("Expected NULL & 0, got NULL & 0.\n");
            return;
        }
    }
    printf("res: %d | arr: ", res);
    for (int i = 0; i < max - min; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main(void)
{
    test(0, 0);
    test(1, 0);
    test(-1, -1);
    test(1, -1);
    test(-1, 0);
    test(-1, 1);
    test(4, 2);
    test(30, 40);
    return 0;
}
