--[[
	Primes.lua
	-----------------------------------------------------------------
	Calculates prime numbers up to a given limit.
	Part of the Primes.* collection of prime number calculators.
	
	©2016 David Prior
	davecheesefish.com | davidprior.media | github.com/davecheesefish
--]]

io.write("Calculate all prime numbers up to: (type a number) ");
local limit = io.read("*n");

if limit == nil then
	print("That's not a number.");
	return;
end

if limit < 2 then
	print("There are no primes less than 2.");
	return;
end

print("Calculating...");


function calculatePrimes(upTo)
	-- Create a table to store calculated primes.
	local primes = {};
	
	-- 2 is a special case, as it's the only even prime number.
	if 2 <= upTo then
		primes[#primes+1] = 2;
	end
	
	-- Now that we've added 2 to the primes table manually, we can start at 3 and add 2 each step
	-- to skip even numbers (which are all divisible by 2, so aren't prime).
	for candidate = 3, upTo, 2 do
		local divisorIndex = 1;
		local isPrime = true;
		-- Test the candidate with prime divisors until the divisor reaches the candidate's square
		-- root. If the candidate is divisible by any of them, it's not prime.
		while primes[divisorIndex] ^ 2 <= candidate do
			if candidate % primes[divisorIndex] == 0 then
				isPrime = false;
				break;
			end
			
			-- Candidate wasn't divisible, move onto the next prime divisor.
			divisorIndex = divisorIndex + 1;
		end
		
		-- If this candidate is prime, add it to the table of primes.
		if isPrime then
			primes[#primes+1] = candidate;
		end
	end
	
	return primes;
end


local primes = calculatePrimes(limit);
for i = 1, #primes, 1 do
	print(primes[i]);
end
