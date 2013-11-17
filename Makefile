run:
	./main.sh -f sample.txt

.PHONY: test
test:
	./main.sh -f test/input.txt > test/output.txt
	diff -s test/expected.txt test/output.txt

clean:
	rm test/output.txt
