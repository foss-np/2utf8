#!/bin/bash

WD="$(dirname $0)"
PRG="$(basename $0)"

function parser_map {
    case $flip in
	'c') utf="अ"; continue;;
	'f') utf="ा"; continue;;
	'O') utf="इ"; continue;;
	'l') utf="ि"; continue;;
	# '') utf="ई"; continue;;
	'L') utf="ी"; continue;;
	'p') utf="उ"; continue;;
	"'") utf="ु"; continue;;
	# '') utf="ऊ"; continue;;
	'"') utf="ू"; continue;;
	'C') utf="ऋ"; continue;;
	'P') utf="ए"; continue;;
	']') utf="े"; continue;;
	# 'i') utf="ऐ"; continue;;
	'}') utf="ै"; continue;;
	# '') utf="ओ"; continue;;
	# '') utf="औ"; continue;;
	's') utf="क"; continue;;
	'S') utf="क्"; continue;;
	'v') utf="ख"; continue;;
	'V') utf="ख्"; continue;;
	'u') utf="ग"; continue;;
	'U') utf="ग्"; continue;;
	'3') utf="घ"; continue;;
	'£') utf="घ्"; continue;;
	'ª') utf="ङ"; continue;;
	'Í') utf="ङ्क"; continue;;


	'r') utf="च"; continue;;
	'R') utf="च्"; continue;;
	'5') utf="छ"; continue;;
	# 'r') utf="छ्"; continue;;
	'h') utf="ज"; continue;;
	'H') utf="ज्"; continue;;
	''|'¤') utf="झ्"; continue;;
	'`') utf="ञ"; continue;;
	'~') utf="ञ्"; continue;;
	'6') utf="ट"; continue;;

	'7') utf="ठ"; continue;;
	'§') utf="ट्ट"; continue;;
	'Ý') utf="ट्ठ"; continue;;

	'8') utf="ड"; continue;;
	'9') utf="ढ"; continue;;
	'0') utf="ण्"; continue;;

	't') utf="त"; continue;;
	'T') utf="त्"; continue;;
	'Q') utf="त्त"; continue;;


	'y') utf="थ"; continue;;
	'Y') utf="थ्"; continue;;
	'b') utf="द"; continue;;
	'å') utf="द्व"; continue;;
	'4') utf="द्ध"; continue;;
	'2') utf="द्द"; continue;;

	'w') utf="ध"; continue;;
	'W') utf="ध्"; continue;;
	'g') utf="न"; continue;;
	'G') utf="न्"; continue;;
	'k') utf="प"; continue;;
	'K') utf="प्"; continue;;
	# '') utf="फ"; continue;;
	'Ï') utf="फ्"; continue;;
	'a') utf="ब"; continue;;
	'A') utf="ब्"; continue;;
	'e') utf="भ"; continue;;
	'E') utf="भ्"; continue;;
	'd') utf="म"; continue;;
	'D') utf="म्"; continue;;
	'o') utf="य"; continue;;
	'Ø') utf="्य"; continue;; # exception no unicode char

	'/') utf="र"; continue;;
	'{') utf="र्"; continue;;
	'¥') utf="र्"; continue;; # exception no unicode char
	'«'|'|') utf="्र"; continue;;
	'?'|'¿') utf="रु"; continue;;
	'[') utf="ृ"; continue;;

	'n') utf="ल"; continue;;
	'N') utf="ल्"; continue;;
	'j') utf="व"; continue;;
	'J') utf="व्"; continue;;
	'z') utf="श"; continue;;
	'Z') utf="श्"; continue;;
	'>') utf="श्र"; continue;;

	# '>') utf="ष"; continue;;
	'i') utf="ष्"; continue;;
	';') utf="स"; continue;;
	':') utf="स्"; continue;;
	'x') utf="ह"; continue;;
	'X') utf="ह्"; continue;;
	'q') utf="त्र"; continue;;
	'I') utf="क्ष्"; continue;;
	'1') utf="ज्ञ"; continue;;

	'B') utf="द्य"; continue;;
	'Ë') utf="ङ्ग"; continue;;

	'!') utf="१"; continue;;
	'@') utf="२"; continue;;
	'#') utf="३"; continue;;
	'$') utf="४"; continue;;
	'%') utf="५"; continue;;
	'^') utf="६"; continue;;
	'&') utf="७"; continue;;
	'*') utf="८"; continue;;
	'(') utf="९"; continue;;
	')') utf="०"; continue;;

	'-') utf="("; continue;;
	'_') utf=")"; continue;;
	'M') utf=":"; continue;;

	'\') utf="्"; continue;;
	'÷') utf="/"; continue;;

	'') utf="!"; continue;;
	'≤' | 'Ù') utf=";"; continue;;
	'.') utf="।"; continue;;
	'<') utf="?"; continue;;
	'æ'| 'Æ') utf='"'; continue;;


	'±') utf="+"; continue;;
	'=') utf="."; continue;;
	'+') utf="ं"; continue;;
	'F'|'') utf="ँ"; continue;;
	'') utf="ँ"; continue;; #unknown only for single case

	'®') utf="र"; continue;;
	'') utf="त्त्‍"; continue;; #has the ZWJ at end

	''|'Ú') utf="'"; continue;;
	''|'') utf="-"; continue;;
	*) utf=$flip;;
    esac
}

function parser_init {
	text=$@  # $@ can't be used for counting
	len=${#text}
	out=""
	for ((i=0; i <= len; i++)); do
		flip=${text:$i:1}
		out=$out$utf
		parser_map
	done
	echo -n $out | sed -f $WD/rules.pattern
}

function read_file {
    while read data; do
		parser_init "$data"
		echo
    done < $1
	exit 0
}

function Usage {
    echo -e "Usage: \t2utf8 [Option]";
    echo -e "\t-h | --help\tDisplay this message"
    echo -e "\t-f | --file\tfile input"
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

TEMP=$(getopt -o f:h\
              -l file:,help\
              -n "2utf8"\
              -- "$@")

if [ $? != "0" ]; then exit 1; fi
eval set -- "$TEMP"


while true; do
    case $1 in
	-f|--file) read_file $2; shift 2;;
	-h|--help) Usage; exit;;
	--)		 shift; break;;
    esac
done

# extra argument
for arg do
   parser_init $arg
   echo -n ' '
done
echo
