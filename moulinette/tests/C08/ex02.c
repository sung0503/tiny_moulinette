#include <stdio.h>
#include <stdlib.h>
#include "ft_abs.h"

void test(int i)
{
	printf("MACRO ABS(%d): %d, abs(%d): %d\n", i, ABS(i), i, abs(i));
}

int main(void)
{
	test(-1);
	test(0);
	test(1);
	test(42);
	test(-2147483647);
	test(-2147483648);
	return 0;
}
