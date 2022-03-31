package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	argv := make([]string, len(os.Args))
	copy(argv, os.Args)

	if len(argv) < 2 {
		log.Fatal("not enough arguments")
	}

	word := argv[1]

	port := os.Getenv("PARROT_PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(word))
	})
	err := http.ListenAndServe(":"+port, nil)
	log.Fatal(err)
}
