package main

import (
	"fmt"
	"net/http"
	"time"
        "math/rand"
)

var number int

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Oops %d %s!", number, r.URL.Path[1:])
}

func main() {
	rand.Seed(time.Now().UTC().UnixNano())
	number = rand.Intn(1000)
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
