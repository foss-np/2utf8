#!/bin/bash

WD="$(dirname $(readlink $0 || echo $0))"
source $WD/parser.sh

function Usage {
    echo -e "Usage: \t2utf8 [Option] ...";
    echo -e "\t-i | --input\tfile input"
    echo -e "\t-f | --f\tfont"
    echo -e "\t-t | --type\tplain(default), xml, doc, docx, pdf"
    echo -e "\t-h | --help\tdisplay this message"
    echo -e "\t-v | --version\tversion information"
}

IFS="" #don't ignore spaces

if [ ! -t 0 ]; then # check pipe
    while read data; do
        parser_init "$data"
    done
    echo
    exit 0
fi

if [ $# -eq 0 ]; then
    Usage
    exit 1;
fi

TEMP=$(getopt -o i:t:hv\
              -l input:,type,:help,version\
              -n "2utf8"\
              -- "$@")

if [ $? != "0" ]; then exit 1; fi
eval set -- "$TEMP"

while true; do
    case $1 in
        -i|--input)   read_file $2; shift 2;;
        -t|--type)    echo "Not Implimented"; shift 2; exit;;
        -h|--help)    Usage; exit;;
        -v|--version) cat $WD/.version; exit;;
        --) shift;    break;;
    esac
done

# extra argument
for arg do
   parser_init $arg
   echo -n ' '
done
echo
