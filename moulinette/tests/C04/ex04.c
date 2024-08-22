#include <unistd.h>

void ft_putnbr_base(int nbr, char *base);

int main(void)
{
    ft_putnbr_base(4242, "");
    ft_putnbr_base(4242, "0");
    ft_putnbr_base(4242, "01");
    ft_putnbr_base(4242, "012345678+");
    ft_putnbr_base(4242, "012345678-");
    ft_putnbr_base(4242, "0123456788");
    ft_putnbr_base(4242, "0123455789");
    write(1, "\n---\n", 5);
    ft_putnbr_base(4242, "abcdefghij");
    write(1, "\n---\n", 5);
    ft_putnbr_base(-4242, "");
    ft_putnbr_base(-4242, "0");
    ft_putnbr_base(-4242, "01");
    ft_putnbr_base(-4242, "012345678+");
    ft_putnbr_base(-4242, "012345678-");
    write(1, "\n---\n", 5);
    ft_putnbr_base(-4242, "abcdefghij");
    write(1, "\n---\n", 5);
    ft_putnbr_base(0, "abcdefghij");
    write(1, "\n---\n", 5);
    ft_putnbr_base(4242, "ab");
    write(1, "\n---\n", 5);
    ft_putnbr_base(4242, "abcd");
    write(1, "\n---\n", 5);
    ft_putnbr_base(4242, "abcdefgh");
    write(1, "\n---\n", 5);
    ft_putnbr_base(4242, "abcdefghijklmnop");
    write(1, "\n---\n", 5);
    return 0;
}
