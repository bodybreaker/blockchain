package main

import (
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
        w.Write([]byte("Hello World\n\n\n\n"))
        w.Write([]byte(req.URL.Path))
    })

    http.ListenAndServe(":80", nil)
}
