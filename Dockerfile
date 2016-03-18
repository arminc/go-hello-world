FROM scratch
ADD go-hello-world go-hello-world
EXPOSE 8080
ENTRYPOINT ["/go-hello-world"]