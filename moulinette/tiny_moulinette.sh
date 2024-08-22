#!/bin/bash

ASSN=$1

FINAL_RESULT=()
EXIT_STATE=0

. "moul/config.sh"

print_header() {
    local text_color=(${GREEN} ${RED} ${BLUE} ${PURPLE} ${PINK})
    printf "${text_color[$((RANDOM % 5))]}"
    printf "████████╗██╗███╗░░██╗██╗░░░██╗\n"
    printf "╚══██╔══╝██║████╗░██║╚██╗░██╔╝\n"
    printf "░░░██║░░░██║██╔██╗██║░╚████╔╝░\n"
    printf "░░░██║░░░██║██║╚████║░░╚██╔╝░░\n"
    printf "░░░██║░░░██║██║░╚███║░░░██║░░░\n"
    printf "░░░╚═╝░░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░\n"
    printf "${DEFAULT}"
    printf "    ver. 0.1.1 23 Aug 2024\n\n"
    printf "  Now testing ${ASSN} assignment\n"
}

print_footer()
{
    printf "\n${PURPLE}------------------------------${DEFAULT}\n\n"
    printf "Result: "
    for result in "${FINAL_RESULT[@]}"; do
        printf "${result} "
    done
    printf "${DEFAULT}\n\n"
}

compile() {
    local num_ex="$1"
    shift
    local source_files=("$@")
    if [ ${ASSN} = "C08" ]; then
        if [ ${num_ex} = "04" ]; then
            cc -Wall -Wextra -Werror -I./moul/tests/C08 -o "./moul/ex04.out" "ex04/ft_strs_to_tab.c" "./moul/tests/C08/ex04.c"
        elif [ ${num_ex} = "05" ]; then
            cc -Wall -Wextra -Werror -I./moul/tests/C08 -o "./moul/ex05.out" "ex04/ft_strs_to_tab.c" "ex05/ft_show_tab.c" "./moul/tests/C08/ex05.c"
        else
            cc -Wall -Wextra -Werror -I./ex${num_ex} -o "./moul/ex${num_ex}.out" "./moul/tests/C08/ex${num_ex}.c"
        fi
    else
        cc -Wall -Wextra -Werror -o "./moul/ex${num_ex}.out" $(ls ex${num_ex}/*) "./moul/tests/${ASSN}/ex${num_ex}.c"
    fi
    return $?
}

test_exercise() {
    local num_ex="$1"
    local test_case="$2"
    if ! compile ${num_ex}; then
        printf "${PURPLE}ex${num_ex}: ${DEFAULT}"
        printf "Compile Error! ${BG_RED}${BOLD} :( ${DEFAULT}\n"
        return 1
    fi
    if [ -n "${test_case}" ]; then
        while IFS= read -r line; do
            echo "---" >> "./moul/ex${num_ex}.user"
            ./moul/ex${num_ex}.out ${line} >> "./moul/ex${num_ex}.user"
        done < "${test_case}"
    else
        ./moul/ex${num_ex}.out > "./moul/ex${num_ex}.user"
    fi
    local diff_result=$(diff "./moul/ex${num_ex}.user" "./moul/tests/${ASSN}/ex${num_ex}.expected" | cat -e)
    if [[ ${diff_result} == "" ]]; then
        printf "${PURPLE}ex${num_ex}: ${DEFAULT}"
        printf "PASS ${BG_GREEN}${BLACK}${BOLD} :D ${DEFAULT}\n"
        return 0
    else
        printf "${diff_result}\n"
        printf "${PURPLE}ex${num_ex}: ${DEFAULT}"
        printf "Diff Fail ${BG_RED}${BOLD} :( ${DEFAULT}\n"
        return 1
    fi
}

test_assignment() {
    local exercises=($(get_exercises ${ASSN}))
    local test_case="./moul/tests/${ASSN}/test_case.txt"
    if [ ! -f "$test_case" ]; then
        test_case=""
    fi
    for ex in "${exercises[@]}"; do
        printf "\n"
        if test_exercise "${ex}" "${test_case}"; then
            FINAL_RESULT+=("${GREEN}ex${ex}:OK${DEFAULT}")
        else
            FINAL_RESULT+=("${RED}ex${ex}:KO${DEFAULT}")
            EXIT_STATE=1
        fi
    done
}

# main
print_header
test_assignment
print_footer
exit ${EXIT_STATE}
