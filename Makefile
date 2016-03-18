.DEFAULT_GOAL := release

build:
	CGO_ENABLED=0 go build -v -a -installsuffix cgo -ldflags '-s'

release:
	docker run --rm -v $(CURDIR):/usr/src/go-hello-world -w /usr/src/go-hello-world golang:1.6 make build