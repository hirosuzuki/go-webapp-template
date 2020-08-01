package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"text/template"
)

func homeHandler(w http.ResponseWriter, r *http.Request) {
	log.Printf("Request: %s\n", r.URL)
	t, err := template.ParseFiles("templates/home.html")
	if err != nil {
		log.Printf("%s\n", err.Error())
		return
	}
	w.WriteHeader(200)
	w.Header().Set("Content-type", "text/html")
	if t.Execute(w, "Home") != nil {
		log.Printf("%s\n", err.Error())
	}
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	http.HandleFunc("/", homeHandler)
	log.Printf("Start App: listening on port %s", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
