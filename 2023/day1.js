const fs = require('node:fs')
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
      const lineValue = getNumbers(dat)
      lineValues.push(lineValue)
    })

    const total = lineValues.reduce((a,b) => a+b)
    console.log(total);
    

  })

}
function getNumbers(text) {
  let targetNum = ''
  
  for (let i = 0; i < text.length; i++) {
    const char = text[i];
    if (!isNaN(char)) {
      targetNum += char
    }
  }

  const firstIndex = targetNum[0] || ''
  const lastIndex = targetNum[targetNum.length - 1] || '' 

  targetNum = firstIndex + lastIndex
  return parseInt(targetNum)
}

main('./input.txt')