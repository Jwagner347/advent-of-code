const fs = require('fs');
const input = fs.readFileSync('input.txt', 'utf8');

const nameMapper = {
    'A': 'rock',
    'B': 'paper',
    'C': 'scissors',
    'X': 'rock',
    'Y': 'paper',
    'Z': 'scissors',
}

const winMapper = {
    // thing is defeated by
    'A': 'Y',
    'B': 'Z',
    'C': 'X',
}

const shapeScoreMapper = {
    'X': 1,
    'Y': 2,
    'Z': 3,
}

const didWin = (line) => {
    const thingThatBeatsOpponent = winMapper[line[0]];
    if (line[1] === thingThatBeatsOpponent) {
        return true;
    }
    return false;
}

const calculateScore = (line) => {
    line = line.split(' ');
    let scorePts = 0;

    if (nameMapper[line[0]] === nameMapper[line[1]]) {
        scorePts = 3;
    }

    if (didWin(line)) {
        scorePts = 6;
    }
    return scorePts + shapeScoreMapper[line[1]];
}

const lines = input.split(/\n/)
const yourScore = lines.reduce((acc, cur) => {
    return acc + calculateScore(cur);
}, 0)
console.log(yourScore);