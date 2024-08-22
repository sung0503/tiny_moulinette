#include <stdio.h>
#include "ft_boolean.h"

int main(void)
{
    t_bool i = -2147483648;
    if (i != -2147483648)
        printf("t_bool error\n");
    if (TRUE == 1)
        printf("TRUE is 1.\n");
    if (FALSE == 0)
        printf("FALSE is 0.\n");
    if (SUCCESS == 0)
        printf("SUCCESS is 0.\n");
    if (EVEN(2))
        printf("EVEN(x) is right.\n");
    if (!(EVEN(3)))
        printf("EVEN(x) is right.\n");
    printf("%s", EVEN_MSG);
    printf("%s", ODD_MSG);
    return 0;
}
