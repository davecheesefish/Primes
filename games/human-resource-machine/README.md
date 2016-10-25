# Primes: Human Resource Machine
A prime number calculator, built in the Tomorrow Corporation game *[Human Resource Machine](http://tomorrowcorporation.com/humanresourcemachine)*.
![Screenshot](./screenshots/2016-10-25.png?raw=true)
Human Resource Machine is a fun little game about instructing an office worker to complete various computational tasks using a basic set of instructions.

## How to Run the Code
To run the code in-game, open primes.txt in a text editor and copy the entire contents to the clipboard. In the game, open Year 40 (Prime Factory) and click the Paste button in an empty program tab. You should then be able to run the program with the big green play button.

If you haven't unlocked Year 40 yet, you probably won't have the foggiest what this program's doing anyway.

**Note:** All output will be placed in floor tile 14 ("OUTBOX"). Because this isn't actually the solution to the puzzle in Year 40 (and HRM lacks a sandbox mode), placing anything in the outbox would result in a "bad outbox" error.


## How It Works
### Setup
The program initially "outbox"es 2, the only even prime number, and initialises the candidate to 3.

### Loop
For each candidate, the divisor is set to (candidate - 1) and the modulus is checked. If it's 0 the candidate is divisible and is not prime. If it's anything other than 0 the divisor is decremented by 2 and checked again. This is repeated until the modulus is found to be 0, or if the divisor reaches a value less than 3 (in which case, the candidate is prime and can be outboxed). Then the candidate is incremented by 2 and the process starts again.

The candidate and divisor are incremented/decremented by 2 to skip uselessly checking even numbers (which are all divisible by 2, and so are not prime). The only exception to this is 2 itself, which is outboxed at the start as a special case.