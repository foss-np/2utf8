default:
	@echo "[FILE=<textfile>] make file"

.PHONY: test
test:
	./main.sh -f test/input.txt > test/output.txt
	diff -s test/expected.txt test/output.txt

clean:
	rm test/output.txt
	