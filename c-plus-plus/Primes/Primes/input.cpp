#include "stdafx.h"
#include "input.h"

namespace primes {
	namespace input
	{
		int get_int(std::istream &stream)
		{
			// TODO: Add validation.
			int input;
			stream >> input;

			return input;
		}
		
		long get_long(std::istream &stream)
		{
			// TODO: Add validation.
			long input;
			stream >> input;

			return input;
		}
	}
}