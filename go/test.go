package main

import (
	"fmt"
	"math"
)

func main() {
	t := 0.0  
	n := 1000000  

	for i := 0; i < n; i++ {
		j := float64(i)
		g := math.Pow(-1.0, j)
		s := g * 1.0 / (2*j + 1.0)
		t += s
	}
	fmt.Printf("%.6f\n", 4.0*t)  
}
