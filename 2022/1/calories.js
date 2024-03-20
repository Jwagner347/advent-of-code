const fs = require('fs');
const input = fs.readFileSync('input.txt', 'utf8');

const lines = input.split(/\n/)

j = 0;
elfArray = [];
for (let i = 0; i < lines.length; i++) {
  const line = lines[i];
  if (line === '') {
    j ++;
    continue;
  }

  elfArray[j] = elfArray[j] || [];
  elfArray[j].push(Number(line));
}

const arrOfCalories = elfArray.map(elf => elf.reduce((acc, cur) => acc + cur)).sort((a, b) => b - a)

console.log(arrOfCalories[0] + arrOfCalories[1] + arrOfCalories[2]);
