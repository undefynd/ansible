#!/usr/bin/env bash

hostname=$1
NAME_OSX="Darwin"
THIS_OS=$(uname -mrs)
COLOR_RED=`tput setaf 1`
COLOR_RESET=`tput sgr0`

custom-sed() {
    if [[ $THIS_OS = *$NAME_OSX* ]]; then
        # Check if OSX and install GSED
        if [ -x "$(command -v gsed)" ]; then
            gsed "$@"
        else
            echo "${COLOR_RED}ERROR. You must install gsed if you are using OSX${COLOR_RESET}"
            exit 1
        fi
    else
        # Linux
        sed "$@"
    fi
}
export -f custom-sed

if [ ${#hostname} -gt 0 ]
then
    custom-sed -i /^$hostname/d ~/.ssh/known_hosts
    echo $hostname
else
    echo "${COLOR_RED}Error! Hostname has a length of ${#hostname} chars."
    echo "no hostname provided, will remove all hosts which contain vagrant.test${COLOR_RESET}"
    custom-sed -i /^[[:alnum:]]*.vagrant.test/d ~/.ssh/known_hosts
fi