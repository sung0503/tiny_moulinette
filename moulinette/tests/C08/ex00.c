#include <stdio.h>
#include "ft.h"

int main(void)
{
    int a = 4;
    int b = 2;
    ft_putchar('a');
    ft_putstr("Hi");
    ft_strcmp("Hello", "World");
    ft_strlen("Hello 42 Gyeongsan");
    ft_swap(&a, &b);
    return 0;
}

void ft_putchar(char c)
{
    printf("ft_putchar called: %c\n", c);
}

void ft_putstr(char *str)
{
    printf("ft_putstr called: %s\n", str);
}

int ft_strcmp(char *s1, char *s2)
{
    printf("ft_strcmp called:\n\t%s\n\t%s\n", s1, s2);
    return 0;
}

int ft_strlen(char *str)
{
    printf("ft_strlen called: %s\n", str);
    return 0;
}

void ft_swap(int *a, int *b)
{
    printf("ft_swap called: %d %d\n", *a, *b);
}
