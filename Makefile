default:
	@echo "[FILE=<textfile>] make file"

file:
	./main.sh -f ${FILE}

test:
	./main.sh -f sample1.txt
	./main.sh -f sample2.txt
	./main.sh -f sample3.txt
	./main.sh -f sample4.txt
	./main.sh -f sample5.txt
	./main.sh -f sample6.txt
