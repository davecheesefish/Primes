// Primes.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "input.h"
#include "Prime.h"
using namespace std;

/**
Shows the main menu.
@returns {int} The user's menu choice.
*/
int main_menu()
{
	int choice;

	do
	{
		cout << "Please choose an option:\n";
		cout << "1. The next prime number after X\n";
		cout << "0. Exit\n";
		choice = primes::input::get_int(cin);
	} while (choice < 0 || choice > 1);

	return choice;
}

int _tmain(int argc, _TCHAR* argv[])
{
	primes::Prime prime;

	int choice;

	do
	{
		choice = main_menu();
		switch (choice)
		{
		case 1:
			// Next prime after X
			cout << "\nEnter a number for X:\n";
			long x = primes::input::get_long(cin);
			cout << "The next prime after " << x << " is " << prime.next(x) << "\n";
			break;
		}

		cout << "\n";
	} while (choice != 0);

	return 0;
}

