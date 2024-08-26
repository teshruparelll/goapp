package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.Println("Hello, Docker!")
		time.Sleep(1 * time.Second) // Pause for 1 second before the next output
	}
}
