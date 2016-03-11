#pragma once
#include "stdafx.h"

namespace primes
{
	/**
	Utility class for calculating prime numbers.
	*/
	class Prime
	{
	public:
		Prime();
		~Prime();

		/**
		Returns the next prime number after the integer provided.
		@argument {int} after The number to find the next prime after.
		@returns {int} The smallest prime number that is larger than the given argument.
		*/
		int next(int after);

	private:
		/**
		List of currently-known primes.
		*/
		std::list<int> primes_;

		/**
		The largest number tested so far for primality.
		*/
		int largest_number_tested_;

		/**
		Finds and returns the next prime number, and adds it to the internal list.
		*/
		int findNext();

		/**
		Returns the largest currently-known prime number.
		*/
		int greatest();
	};
}

