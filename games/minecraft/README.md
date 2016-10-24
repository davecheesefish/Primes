# Primes: Minecraft
An 8-bit redstone computer system which calculates the sequence of prime numbers, built in Minecraft 1.10.2.
![Daytime screenshot](./screenshots/2016-10-11_21.07.10.png?raw=true)
![Nighttime screenshot](./screenshots/2016-10-11_19.57.24.png?raw=true)

## How to Load the Map
Copy the Primes folder in this directory to your Minecraft `saves` folder. Run Minecraft and load the Primes save from your single-player saves list.

The button to set the computer in motion is on top of the machine, below the big glowing blue arrow. Press the button once to calculate the next prime number. It will be displayed in binary on the large panel behind the button once the "Calculation in progress" lamp turns off. Due to the complexity of the system, the computation can take a long time to complete.

## How It Works
There are three main parts to the system:
- An incremental counter for prime number candidates (the "candidate counter"),
- A decremental counter for potential divisors (the "divisor counter"),
- An 8-bit binary divider made up of 8 conditional full subtractors.

### The Full Process
1. The GO! "button" is pressed.
2. The candidate counter is incremented by 1 and its value is copied to the divisor counter.
3. The divisor counter is decremented by 1. If the divisor counter now has a value of 1 the candidate is prime, so stop execution. Otherwise:
4. The binary divider attempts to divide the candidate by the divisor. If there is no remainder, the candidate was divisible by the candidate and is not prime - repeat steps 2 to 4. Otherwise, it is not divisible by this divisor - repeat steps 3 to 4 to check other divisors.

## Resources and Credits
- This project uses [Ammorth's compact full adder](https://www.youtube.com/watch?v=UFSAPe761QY). To turn an adder into a subtractor, invert one input and pull the carryIn bit high on the adder for the least significant bit. For a conditional subtractor, pass the first argument straight through unchanged if the carryOut bit for the whole subtractor is off.
- [Newomaster's guide to binary division in Minecraft](https://www.youtube.com/watch?v=ErSMllv42HY)