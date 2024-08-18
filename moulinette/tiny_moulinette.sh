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
    printf "    ver. 0.0.19 19 Aug 2024\n"
}

print_footer()
{
    printf "\n${PURPLE}--------------------------------------------------${DEFAULT}\n\n"
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
    cc -Wall -Wextra -Werror -o "./moul/ex${num_ex}.out" $(ls ex${num_ex}/*.c) "./moul/tests/${ASSN}/ex${num_ex}.c"
    return $?
}

test_exercise() {
    local num_ex="$1"
    local arguments="$2"
    if ! compile ${num_ex}; then
        printf "${PURPLE}ex${num_ex}: ${DEFAULT}"
        printf "${BG_RED}${BOLD} Compile KO :( ${DEFAULT}\n"
        return 1
    fi
    ./moul/ex${num_ex}.out > "./moul/ex${num_ex}.user"
    local diff_result=$(diff "./moul/ex${num_ex}.user" "./moul/tests/${ASSN}/ex${num_ex}.expected" | cat -e)
    printf "${diff_result}\n"
    if [[ ${diff_result} == "" ]]; then
        printf "${PURPLE}ex${num_ex}: ${DEFAULT}"
        printf "${BG_GREEN}${BLACK}${BOLD} OK :D ${DEFAULT}\n"
        return 0
    else
        printf "${PURPLE}ex${num_ex}: ${DEFAULT}"
        printf "${BG_RED}${BOLD} Diff KO :( ${DEFAULT}\n"
        return 1
    fi
}

test_assignment() {
    local exercises=($(get_exercises ${ASSN}))

    for ex in "${exercises[@]}"; do
        printf "\n"
        if test_exercise "${ex}"; then
            FINAL_RESULT+=("${GREEN}ex${ex}:OK${DEFAULT}")
        else
            FINAL_RESULT+=("${RED}ex${ex}:KO${DEFAULT}")
        fi
    done
}

# main
print_header
test_assignment
print_footer
