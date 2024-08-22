#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

char **ft_split(char *str, char *charset);

void test(char *str, char *charset)
{
    int i = -1;
    char **res;
    res = ft_split(str, charset);
    printf("---\n");
    while (res[++i] != 0)
    {
        printf("%s\n", res[i]);
    }
}

int main(void)
{
    test("Hello 42 Gyeongsan So Hot Place.", "");
    test("Hello 42 Gyeongsan So Hot Place.", ". ");
    test("Hello 42 Gyeongsan So Hot Place.", "4");
    test("Hello 42 Gyeongsan So Hot Place.", "e");
    test("aaaa", "a");
    test("aaabbbaaabbbaaa", "a");
    test("aaabbbaaabbbaaa", "ab");
    test("bsaasbsabsabsabasbsabsabsabsabsabsabssbsbaasbsabsabsabsabsabbbbbbasbs", "abs");
    return 0;
}
