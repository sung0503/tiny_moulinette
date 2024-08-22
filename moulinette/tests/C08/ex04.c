#include <stdio.h>
#include <stdlib.h>
#include "ft_stock_str.h"

struct s_stock_str *ft_strs_to_tab(int ac, char **av);

void test(t_stock_str *par)
{
    printf("---\n");
    if (par == NULL)
    {
        printf("NULL\n");
        return;
    }
    for (int i = 0; par[i].str != 0; i++)
    {
        printf("%s\n", par[i].str);
        printf("%d\n", par[i].size);
        printf("%s\n", par[i].copy);
    }
}

int main(void)
{
    char **arr = (char **)malloc(6 * sizeof(char *));

    arr[0] = "Hello";
    arr[1] = "42";
    arr[2] = "Gyeongsan";
    arr[3] = "Fucking";
    arr[4] = "So";
    arr[5] = "Hot";

    test(ft_strs_to_tab(-1, NULL));
    test(ft_strs_to_tab(0, NULL));
    test(ft_strs_to_tab(1, NULL));
    test(ft_strs_to_tab(-1, arr));
    test(ft_strs_to_tab(0, arr));
    test(ft_strs_to_tab(1, arr));
    test(ft_strs_to_tab(2, arr));
    test(ft_strs_to_tab(3, arr));
    test(ft_strs_to_tab(4, arr));
    test(ft_strs_to_tab(5, arr));
    test(ft_strs_to_tab(6, arr));
    return 0;
}
