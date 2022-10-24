.PHONY: build clean deploy

build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/hello src/hello.go
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/world src/world.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose
