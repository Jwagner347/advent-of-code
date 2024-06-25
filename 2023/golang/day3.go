package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"unicode"
)

// 1. get row number and column number of every symbol
// 2. get row number and column number of every number as a slice
// 3. check if the number overlaps with the symbol

type num struct {
	col []int
	val int
}

func main() {
	var numbers []num
	// read input file line by line
	file, err := os.Open("input.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		fmt.Printf("line: %v\n", line)
		var numHolder []int
		var colHolder []int

		processDigit := func() {
			if len(numHolder) > 0 {
				value := 0
				for _, num := range numHolder {
					value = value*10 + num
				}
				newNum := num{
					col: colHolder,
					val: value,
				}
				numbers = append(numbers, newNum)
				numHolder = []int{}
				colHolder = []int{}
			}
		}
		for col, c := range line {
			// check if c is a number
			if unicode.IsDigit(c) {
				digit := int(c - '0')
				numHolder = append(numHolder, digit)
				colHolder = append(colHolder, col)
			} else {
				processDigit()
			}
		}
		processDigit()
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	for _, num := range numbers {
		fmt.Printf("Number is:%d\n", num.val)
		fmt.Printf("Column is:%d\n", num.col)
	}
}
