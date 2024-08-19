#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

. "${SCRIPT_DIR}/moulinette/config.sh"

sigint_handler() {
    printf "${RED}Script Aborted. Cleaning up...\n"
    rm -rf moul
    printf "${GREEN}Cleaning done.${DEFAULT}\n"
    exit 1
}

check_norminette() {
    if command -v norminette >/dev/null 2>&1; then
        printf "\n"
        norminette
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
