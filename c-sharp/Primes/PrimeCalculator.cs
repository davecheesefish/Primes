using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Primes
{
    /// <summary>
    /// Class used to calculate prime numbers.
    /// </summary>
    static class PrimeCalculator
    {
        /// <summary>
        /// Calculates and returns a list of the first (count) primes.
        /// </summary>
        /// <param name="count">The number of primes to calculate.</param>
        /// <returns>A list of the first (count) prime numbers.</returns>
        public static List<int> GetFirstPrimes(int count){
            if (count < 0)
            {
                count = 0;
            }

            List<int> primes = new List<int>();
            
            // Since 2 is the only even prime number, we can shortcut adding it to the list to
            // avoid the overhead of having a special case in the main checking loop.
            if (count > 0){
                primes.Add(2);
            }
        
            int primeCandidate = 3; // Current candidate for being prime.
            bool divisible = false;
            while (primes.Count < count) // While we have fewer primes than asked for...
            {
                divisible = false;
                foreach (int prime in primes){ // Check the candidate is not divisible by any lower primes.
                    if (prime * prime > primeCandidate)
                    {
                        // We only need to check divisibility of primes up to the square root of
                        // the candidate, so break if prime^2 is more than it.
                        break;
                    }
                    
                    if (primeCandidate % prime == 0)
                    {
                        // Mark as divisible if there is no remainder.
                        divisible = true;
                        break;
                    }
                }

                if (!divisible)
                {
                    primes.Add(primeCandidate);
                }

                primeCandidate += 2; // Since even numbers are all divisible by 2, we can skip over them.
            }

            return primes;
        }
    }
}
