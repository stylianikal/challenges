package main

import (
	"fmt"
	"math"
)

func main() {
	t := 1.0
	n := 10
	for i := 1; i <= n; i++ {
		j := float64(i)
		g := math.Pow(-1.0, j)
		s := g * 1.0 / (2*j + 1.0)
		t += s
	}
	fmt.Printf("%.12f\n", 4.0*t)
}
