package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", HomeHandler)
	http.HandleFunc("/login", LoginHandler)
	http.HandleFunc("refresh", RefreshHandler)

	log.Fatal(http.ListenAndServe(":8080", nil))
}
