all: calc.go tokenizer.go
	gofmt -l -s -w *.go
	go build $^

run: all
	./calc

tokenizer.go: tokenizer.l
	golex -o $@ $<

calc.go: calc.y
	goyacc -o $@ $<

clean:
	go clean
	rm -f tokenizer.go calc.go lex.yy.go y.go y.output *~

nuke: clean
	rm -f calc

