// Toggle re-written in Go

package main

import (
    "log"
    "os"
    "net/http"
    "strconv"
    )

var healthy bool = true
var port string = "8080"

func main() {

    if len(os.Args) > 1 { port = os.Args[1] }
        
    http.HandleFunc("/", rootHandler)
    http.HandleFunc("/toggle", toggleHandler)
    log.Printf("Bound to port " + port)
    http.ListenAndServe(":" + port, nil)

}

func rootHandler(w http.ResponseWriter, r *http.Request){
    if healthy {
        w.WriteHeader(http.StatusOK)
        w.Write([]byte("200 - OK"))
        log.Printf("200 - OK")
    } else {
        w.WriteHeader(http.StatusGone)
        w.Write([]byte("410 - Gone"))
        log.Printf("410 - Gone")
    }
}

func toggleHandler(w http.ResponseWriter, r *http.Request){
    healthy = !healthy
    w.Write([]byte("Setting health to " + strconv.FormatBool(healthy)))
    log.Printf("Setting health to %v", healthy)
}


