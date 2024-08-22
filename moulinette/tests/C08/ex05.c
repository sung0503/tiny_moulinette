#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "ft_stock_str.h"

struct s_stock_str *ft_strs_to_tab(int ac, char **av);
void ft_show_tab(struct s_stock_str *par);

int main(void)
{
    char **arr = (char **)malloc(6 * sizeof(char *));

    arr[0] = "Hello";
    arr[1] = "42";
    arr[2] = "Gyeongsan";
    arr[3] = "So";
    arr[4] = "Hot";
    arr[5] = "Place";

    write(1, "---\n", 4);
    ft_show_tab(ft_strs_to_tab(1, arr));
    write(1, "---\n", 4);
    ft_show_tab(ft_strs_to_tab(2, arr));
    write(1, "---\n", 4);
    ft_show_tab(ft_strs_to_tab(3, arr));
    write(1, "---\n", 4);
    ft_show_tab(ft_strs_to_tab(4, arr));
    write(1, "---\n", 4);
    ft_show_tab(ft_strs_to_tab(5, arr));
    write(1, "---\n", 4);
    ft_show_tab(ft_strs_to_tab(6, arr));
    return 0;
}
