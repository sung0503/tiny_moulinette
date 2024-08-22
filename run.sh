#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

. "${SCRIPT_DIR}/moulinette/config.sh"

sigint_handler() {
    printf "${RED}Script Aborted. Cleaning up...\n"
    rm -rf moul
    printf "${GREEN}Cleaning done.${DEFAULT}\n"
    exit 1
}

run_norminette() {
    if [ ${ASSN} = "C08" ]; then
        cd "ex00"
        norminette
        cd "../ex01"
        norminette -R CheckDefine
        cd "../ex02"
        norminette -R CheckDefine
        cd "../ex03"
        norminette
        cd "../ex04"
        norminette
        cd "../ex04"
        norminette
        cd ..
    else
        norminette -R CheckForbiddenSourceHeader
    fi
}

check_norminette() {
    if command -v norminette >/dev/null 2>&1; then
        printf "\n"
        run_norminette
        printf "\n"
    else
        printf "\n${RED}norminette not found${GREY}, skip ${DEFAULT}\n\n"
    fi
}

check_dirname() {
    readonly ASSN=$(basename "$(pwd)")
    if [[ ${ASSN} =~ ^C(0[0-9]|1[0-3])$ ]]; then
        return 0
    else
        return 1
    fi
}

trap 'sigint_handler' SIGINT

if check_dirname; then
    check_norminette
    cp -r "${SCRIPT_DIR}/moulinette" moul
    ./moul/tiny_moulinette.sh "${ASSN}"
    if [ $? -eq 0 ]; then
        rm -rf moul
        exit 0
    else
        rm -rf moul
        exit 1
    fi
else
    printf "${RED}Current directory does not match expected pattern (C[00~13]).${DEFAULT}\n"
    exit 1
fi
