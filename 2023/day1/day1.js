const fs = require('node:fs')

const textToNum = {
  'one': "1",
  'two': "2",
  'three': "3",
  'four': "4",
  'five': "5",
  'six': "6",
  'seven': "7",
  'eight': "8",
  'nine': "9",
}

function isNumber(char) {
  return !isNaN(parseInt(char))
}

function reverseText(text) {
  return text.split('').reverse().join('')
}

const reversedKeys = Object.keys(textToNum).map(k => {
  return reverseText(k)
})

const reversedTextToNum = {}

reversedKeys.forEach((k, i) => {
  reversedTextToNum[k] = i + 1
})

// 1. main function that reads the file and processes each line and holds the total sum
function main(file) {
  fs.readFile(file, 'utf-8', (err, data) => {
    if (err) {
      console.error(err);
      return
    }

    // split at new line
    const splitData = data.split('\n')
    const lineValues = []

    splitData.forEach(dat => {
      // const convertedData = convertTextToNum(dat)
      const lineValue = getNumber(dat)
      lineValues.push(lineValue)
    })

    const total = lineValues.reduce((a,b) => a+b)
    console.log("total: ", total);
  })

}

function getNumber(text) {
  let targetNum = ''
  
  let firstNumber;
  let lastNumber;

  for (let i = 0; i < text.length; i++) {
    const char = text[i];
    if (isNumber(char)) {
      firstNumber = char
    } else {
      Object.keys(textToNum).forEach(k => {
        if (text.substring(i).startsWith(k)) {
          firstNumber = textToNum[k]
        }
      })     
    }
    if (firstNumber) {
      break
    }
  }

  const reversedText = text.split('').reverse().join('')

  for (let i = 0; i < reversedText.length; i++) {
    const char = reversedText[i];
    if (isNumber(char)) {
      lastNumber = char
    } else {
      Object.keys(reversedTextToNum).forEach(k => {
        if (reversedText.substring(i).startsWith(k)) {
          lastNumber = reversedTextToNum[k]
        }
      })     
    }
    if (lastNumber) {
      break
    }
  }
  
  targetNum = firstNumber + lastNumber 
  return parseInt(targetNum)
}

main('./input.txt')