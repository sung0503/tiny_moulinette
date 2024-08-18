#!/bin/bash

readonly GREEN='\033[38;5;84m'
readonly RED='\033[38;5;197m'
readonly BLUE='\033[38;5;45m'
readonly PURPLE='\033[38;5;63m'
readonly PINK='\033[38;5;207m'
readonly BLACK='\033[38;5;0m'
readonly BG_GREEN='\033[48;5;84m'
readonly BG_RED='\033[48;5;197m'
readonly GREY='\033[38;5;8m'
readonly BOLD='\033[1m'
readonly DEFAULT='\033[0m'
readonly CHECKMARK='\xE2\x9C\x93'

sigint_handler() {
    echo "${RED}Script Aborted. Cleaning up..."
    rm -rf moul
    echo "${GREEN}Cleaning done.${DEFAULT}"
    exit 1
}

exit_handler() {
    rm -rf moul
}

get_exercises() {
    local ASSN="$1"
    local number_of_exercise=0
    local -a arr

    case "${ASSN: -2}" in
        "00")
            number_of_exercise=9
            ;;
        "01")
            number_of_exercise=9
            ;;
        "02")
            number_of_exercise=13
            ;;
        "03")
            number_of_exercise=6
            ;;
        "04")
            number_of_exercise=6
            ;;
        "05")
            number_of_exercise=9
            ;;
        "06")
            number_of_exercise=4
            ;;
        "07")
            number_of_exercise=6
            ;;
        "08")
            number_of_exercise=6
            ;;
        "09")
            number_of_exercise=3
            ;;
        "10")
            number_of_exercise=4
            ;;
        "11")
            number_of_exercise=8
            ;;
        "12")
            number_of_exercise=18
            ;;
        "13")
            number_of_exercise=8
            ;;
        *)
            echo "Invalid input."
            return 1
            ;;
    esac

    # generate array
    for i in $(seq -f "%02g" 0 ${number_of_exercise}); do
        arr+=("$i")
    done
    echo "${arr[@]}"
}
