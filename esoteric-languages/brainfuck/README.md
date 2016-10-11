# Primes: Brainfuck

A console application for finding prime numbers, written in the esoteric programming language Brainfuck. The program will start at 2 and continue until it reaches the maximum value the environment will allow (255 with 8-bit memory cells).

## About the Language: Brainfuck
Brainfuck is an intentionally difficult-to-use minimalist esoteric programming language, which operates on a 1-dimensional "tape" of memory cells. A pointer, initially pointing to the first cell, dictates which memory cell any operations will affect.

There are only 8 commands in Brainfuck:
- `+` Increment the pointed-at memory cell's value by 1.
- `-` Decrement the pointed-at memory cell's value by 1.
- `>` Move the pointer to the next cell to the right.
- `<` Move the pointer to the next cell to the left.
- `,` Take a character from the input and store it in the pointed-at memory cell.
- `.` Output the character indicated by the value in the pointed-at cell.
- `[` Start of a block. Execution will only enter the block if the current cell has a non-zero value.
- `]` End of a block. Execution will wrap back to the start of the block if the current cell has a non-zero value.

All other characters are considered comments and are ignored.

[Read more about Brainfuck on the Esoteric Programming Languages Wiki](https://esolangs.org/wiki/Brainfuck).

## Environmental Assumptions
This program works assuming the following environmental conditions are met:
- Memory cells are 8 bits in size.
- All values are unsigned. No negative numbers.

## The Simplest Way to Run the Program
If you just want to run the code, you can open [primes.bf](./primes.bf) with any text editor and copy/paste the contents into any Brainfuck interpreter, such as [this online one](https://copy.sh/brainfuck/).

## Development
The Brainfuck version of Primes was developed using [Visual Brainfuck](http://kuashio.blogspot.co.uk/2011/08/visual-brainfuck.html), a free Brainfuck IDE by Kuashio.
