/**
input namespace - A namespace of utility functions for getting and processing user input.
*/
#pragma once
#include <iostream>

namespace primes {
	namespace input
	{
		/**
		Gets and returns an integer from the given stream.
		@argument {std::istream} stream The stream to read from.
		@returns {int}
		*/
		int get_int(std::istream &stream);

		/**
		Gets and returns a long integer from the given stream.
		@argument {std::istream} stream The stream to read from.
		@returns {long}
		*/
		long get_long(std::istream &stream);
	}
}