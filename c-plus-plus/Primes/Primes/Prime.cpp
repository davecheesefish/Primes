#include "stdafx.h"
#include "Prime.h"

namespace primes
{
	///////////////////////////////////////////////////////////////////////////
	// Prime class - public methods
	///////////////////////////////////////////////////////////////////////////

	Prime::Prime()
	{
		// Set up primes list.
		primes_.push_back(2);
		primes_.push_back(3);
		largest_number_tested_ = 3;
	}


	Prime::~Prime()
	{
	}

	int Prime::next(int after)
	{
		// Make sure the greatest prime known is larger than the argument.
		while (greatest() <= after)
		{
			findNext();
		}

		for each (int prime in primes_)
		{
			// Return the first prime that is greater than the argument.
			if (prime > after)
			{
				return prime;
			}
		}
	}

	///////////////////////////////////////////////////////////////////////////
	// Prime class - private methods
	///////////////////////////////////////////////////////////////////////////

	int Prime::findNext()
	{
		// Primality flag.
		bool is_prime;
		
		// While a new prime hasn't been found, keep searching.
		while (true)
		{
			is_prime = true;

			// Get the next number to test.
			// Add 2 to skip even numbers.
			largest_number_tested_ += 2;

			// Test whether the number can be divided by any of the currently-known
			// primes.
			for each (int prime in primes_)
			{
				// End search if the current prime is larger than the square root
				// of the number being tested.
				if (prime * prime > largest_number_tested_)
				{
					break;
				}

				if (largest_number_tested_ % prime == 0)
				{
					is_prime = false;
					break;
				}
			}

			// If a new prime has been found, push it onto the primes list and return it.
			if (is_prime){
				primes_.push_back(largest_number_tested_);
				return largest_number_tested_;
			}
		}
	}

	int Prime::greatest()
	{
		// Primes in the list are in ascending size order, so return the last one.
		return primes_.back();
	}
}