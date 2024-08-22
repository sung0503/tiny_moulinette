#include <stdio.h>

int *ft_range(int min, int max);

void test(int min, int max)
{
    int *arr = ft_range(min, max);
    if (min >= max)
    {
        if (arr != NULL)
        {
            printf("Expected NULL, but not NULL.\n");
            return;
        }
        else
        {
            printf("Expected NULL, got NULL.\n");
            return;
        }
    }
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
