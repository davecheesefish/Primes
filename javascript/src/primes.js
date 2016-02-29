'use strict';

(function(){
	
	// Create a class to encapsulate private variables and increase readability.
	var Primes = function(window){
		// Private "members"
		var maxNumTested = 3,
			primeNos = [2, 3];
		// We start at 3 because 2 is the only even prime. We can simply add 2 at each step to skip
		// all of the even numbers after that.
		
		/**
		 * Internal function for finding the next greatest prime and pushing it onto the primeNos
		 * array.
		 * @returns {Number} The new greatest prime found.
		 */
		this.findNext = function(){
			// If maxNumTested is even, roll back to the last odd number.
			if ( !(maxNumTested & 1)){
				--maxNumTested;
			}
			
			while (true){
				maxNumTested += 2;
				
				// If maxNumTested is prime, push it onto the primeNos array and return it.
				if (this.isPrime(maxNumTested)){
					primeNos.push(maxNumTested);
					return maxNumTested;
				}
			}
		};
		
		/**
		 * Checks whether the given number is prime.
		 * @param   {Number}  num A number to check for primality.
		 * @returns {Boolean} True if the number is prime, false otherwise.
		 */
		this.isPrime = function(num){
			// 0, 1 and negative numbers are not considered prime.
			if (num < 2){
				return false;
			}
			
			// Only integers can be prime. Reject any floats.
			if (num % 1){
				return false;
			}
			
			// We need all the primes up to the square root of the number to be checked, so make
			// sure we have those first.
			while (maxNumTested * maxNumTested < num){
				this.findNext();
			}
			
			// Now that we have all the required numbers, check if num is divisible by any prime up
			// to its square root.
			for (var i in primeNos){
				if (num % primeNos[i] === 0){
					// If num is divisible (remainder 0), it is not prime.
					return false;
				}
				
				// If we've reached the square root, stop searching.
				if (primeNos[i] * primeNos[i] > num){
					break;
				}
			}
			
			return true;
		};
		
		/**
		 * Returns the largest prime found so far.
		 * @returns {Number} The largest prime number discovered by this class so far.
		 */
		this.largestFound = function(){
			// Since the array is ordered by size, simply return the last element.
			return primeNos[primeNos.length - 1];
		};
		
		/**
		 * Returns the next prime number after num.
		 * @param {Number} num The number to start from when looking for primes. The prime returned
		 * will be greater than this number.
		 */
		this.next = function(num){
			var largestPrime = this.largestFound();
			
			if (num < largestPrime){
				// If num is less than the largest prime found so far, return the first one that is
				// greater than num.
				for (var index in primeNos){
					if (primeNos[index] > num){
						return primeNos[index];
					}
				}
			} else {
				// If num is greater than the largest prime so far, keep searching until a larger one
				// is found.
				while (true){
					largestPrime = this.findNext();
					if (largestPrime > num){
						return largestPrime;
					}
				}
			}
		};
	};
	
	window.primes = new Primes();
	
})(this);