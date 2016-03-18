.DEFAULT_GOAL := release

test:
	go test

build:
	CGO_ENABLED=0 go build -v -a -installsuffix cgo -ldflags '-s'

release:
	docker run --rm -v $(CURDIR):/usr/src/go-hello-world -w /usr/src/go-hello-world golang:1.6 make build

docker:
	docker build -t arminxebia/go-hello-world:${TRAVIS_BRANCH} .
	docker push arminxebia/go-hello-world:${TRAVIS_BRANCH}
