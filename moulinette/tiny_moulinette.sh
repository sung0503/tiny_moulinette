#!/bin/bash

ASSN=$1

FINAL_RESULT=()

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
    printf "    ver. 0.0.1 18 Aug 2024\n\n"
}

print_footer()
{
    printf "${PURPLE}----------------------------------------${DEFAULT}\n"
    printf "Result: %s\n" "${FINAL_RESULT[*]}"
    printf "${GREY}Test completed.${DEFAULT}.\n"
}

compile() {
    local num_ex="${1}"
    cc -Wall -Wextra -Werror -o "./moul/ex${num_ex}.out" "./ex${num_ex}/*.c" "./moul/tests/${ASSN}/ex${num_ex}.c"
    return $?
}

test_exercise() {
    local num_ex="$1"
    local arguments="$2"
    if !compile ${num_ex}; then
        return 1
    fi
    . "./moul/ex${num_ex}.out" ${arguments} > "./moul/ex${num_ex}_user" 2>&1
    local diff_result=$(diff "./moul/ex${num_ex}_user" "./moul/ex${num_ex}_expected" | cat -e)
    if [[ ${diff_result} == "" ]]
    then
        printf "${BG_GREEN}${BLACK}${BOLD} Diff OK :D ${DEFAULT}\n"
        return 0
    else
        printf "${BG_RED}${BOLD} Diff KO :( ${DEFAULT}\n"
        return 1
    fi
}

test_assignment() {
    local exercises=($(get_exercises ${ASSN}))

    for ex in "${exercises[@]}"; do
        if test_exercise "${ex}"; then
            FINAL_RESULT+=("${GREEN}ex${ex}: OK${DEFAULT}")
        else
            FINAL_RESULT+=("${RED}ex${ex}: KO${DEFAULT}")
        fi
    done
}

# main

print_header
test_assignment
print_footer
