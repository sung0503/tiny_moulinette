#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

char *ft_strjoin(int size, char **strs, char *sep);

int main(void)
{
    char **arr = (char **)malloc(6 * sizeof(char *));

    arr[0] = "Hello";
    arr[1] = "42";
    arr[2] = "Gyeongsan";
    arr[3] = "So";
    arr[4] = "Hot";
    arr[5] = "Place";

    printf("%s\n", ft_strjoin(0, arr, " "));
    printf("%s\n", ft_strjoin(1, arr, " "));
    printf("%s\n", ft_strjoin(2, arr, " "));
    printf("%s\n", ft_strjoin(3, arr, " "));
    printf("%s\n", ft_strjoin(4, arr, " "));
    printf("%s\n", ft_strjoin(5, arr, " "));
    printf("%s\n", ft_strjoin(6, arr, " "));
    printf("%s\n", ft_strjoin(6, arr, ","));
    printf("%s\n", ft_strjoin(6, arr, ", "));
    printf("%s\n", ft_strjoin(6, arr, ", -"));
    return 0;
}
