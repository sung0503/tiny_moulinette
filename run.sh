#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

. "${SCRIPT_DIR}/moulinette/color.sh"

sigint_handler() {
    echo "${RED}Script Aborted. Cleaning up..."
    rm -rf moul
    echo "${GREEN}Cleaning done.${DEFAULT}"
    exit 1
}

check_norminette() {
    if command -v norminette >/dev/null 2>&1; then
        norminette
    else
        echo "${RED}norminette not found, skip${DEFAULT}"
    fi
}

check_dirname() {
    readonly ASSN=$(basename "$(pwd)")
    case ${ASSN} in
        C0[0-9]|C1[0-3])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
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
