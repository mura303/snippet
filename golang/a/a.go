package main

import "fmt"

func main(){

	a := []int{1,2,3,4,5,4,3}

	for i, v := range a{
		fmt.Printf( "%d %d\n", i, v )
	}
}
