#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

. "${SCRIPT_DIR}/moulinette/config.sh"

check_norminette() {
    if command -v norminette >/dev/null 2>&1; then
        norminette
    else
        echo "${RED}norminette not found, skip${DEFAULT}"
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
    rm -rf moul
else
    echo "${RED}Current directory does not match expected pattern (C[00~13]).${DEFAULT}"
    exit 1
fi
