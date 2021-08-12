package main

import "fmt"

func main() {
    ch := make(chan int, 1)

    //수신자가 없더라도 보낼 수 있다.
    ch <- 101
    fmt.Println(<-ch)
}
