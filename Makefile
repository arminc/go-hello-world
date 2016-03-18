.DEFAULT_GOAL := release

test:
	go test

build:
	CGO_ENABLED=0 go build -v -a -installsuffix cgo -ldflags '-s'

release:
	docker run --rm -v $(CURDIR):/usr/src/go-hello-world -w /usr/src/go-hello-world golang:1.6 make build

docker:
	docker build -t arminc/go-hello-world:`git rev-parse --abbrev-ref HEAD` .
	docker push arminc/go-hello-world:`git rev-parse --abbrev-ref HEAD`

dockercloud:
	if [$TRAVIS_PULL_REQUEST != false]; then
		docker-cloud service run -p 8080 --name $TRAVIS_PULL_REQUEST arminc/go-hello-world:`git rev-parse --abbrev-ref HEAD`
	fi
