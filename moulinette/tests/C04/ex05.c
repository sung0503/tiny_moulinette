#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int ft_atoi_base(char *str, char *base);

void test(char *str, char *base)
{
    int res = ft_atoi_base(str, base);
    printf("%d\n", res);
}

int main(void)
{
    test("4242", "");
    test("1000010010010", "01");
    test("4242", "012345678+");
    test("4242", "012345678-");
    test("4242", "012345678 ");
    test("4242", "012345678\t");
    test("4242", "012345678\n");
    test("4242", "012345678\v");
    test("4242", "012345678\f");
    printf("---\n");
    test("4242", "abcdefghij");
    printf("---\n");
    test(" \t\n\v\f+1234", "012345678\t");
    test(" \t\n\v\f+-1234", "0123456789");
    test(" \t\n\v\f+--1234", "0123456789");
    test(" \t\n\v\f-+-1234", "0123456789");
    test(" \t\n\v\f-+--1234", "0123456789");
    test(" \t\n\v\f-+-1234a", "0123456789");
    test(" \t\n\v\f-+-123a4", "0123456789");
    test(" \t\n\v\f-+-12a34", "0123456789");
    test(" \t\n\v\f-+-1a234", "0123456789");
    test(" \t\n\v\f-1234-", "0123456789");
    test(" \t\n\v\f+1234-", "0123456789");
    printf("---\n");
    test(" \t\n\v\f-+-IOI", "OI");
    test(" \t\n\v\f-+-!@!", "@!");
    test(" \t\n\v\f-+-^%^", "%^");
    printf("---\n");
    return 0;
}
