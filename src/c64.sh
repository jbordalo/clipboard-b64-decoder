#!/bin/bash

mode=0

function usage {
    echo "<usage> ./c64.sh -m [MODE]"
    exit 1
}

function help {
    echo "[MODE] - 0 for primary clipboard, 1 for explicit copy-paste clipboard"
    echo "0 is the default mode if -m is not present"
    exit 1
}

while getopts 'm:h' flag;
do
    case "${flag}" in
        h) help ;;
        m) mode=${OPTARG} ;;
        *) usage ;;
    esac
done
#É? BUÉDA FIXE
# MODE 0 is for PRIMARY CLIPBOARD
if [ $mode -eq 0 ]
then
    xclip -o | base64 --decode | xclip 
# MODE 1 is for EXPLICIT CLIPBOARD
else
    xclip -sel clip -o | base64 --decode | xclip -sel clip 
fi
