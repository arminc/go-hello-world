package main

import (
	"fmt"
	"math/rand"
	"net/http"
	"time"
)

var number int

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "BLA %d %s!", number, r.URL.Path[1:])
}

func main() {
	rand.Seed(time.Now().UTC().UnixNano())
	number = rand.Intn(1000)
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
