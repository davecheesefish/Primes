using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Primes
{
    class Program
    {
        static void Main(string[] args)
        {
            // Show the main menu.
            ShowMainScreen();

#if DEBUG
            // Keep the console open to show results.
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
#endif
        }


        /// <summary>
        /// Shows the main menu.
        /// </summary>
        public static void ShowMainScreen()
        {
            string inputStr;
            int input = 0;
            bool isValidInput;

            do
            {
                isValidInput = true;

                // Get input from user.
                Console.WriteLine("How many primes would you like?");
                inputStr = Console.ReadLine();

                if (!int.TryParse(inputStr, out input))
                {
                    // Input was not a number. Flag input as invalid.
                    isValidInput = false;
                }

                // Make sure input is a sane number.
                if (isValidInput && (input < 0))
                {
                    isValidInput = false;
                }

                if (!isValidInput)
                {
                    // Input was invalid. The do...while loop will restart.
                    Console.WriteLine("Invalid selection. Please enter a non-negative integer.");
                }
            } while (!isValidInput);

            List<int> primes = PrimeCalculator.GetFirstPrimes(input);

            foreach (int prime in primes)
            {
                Console.WriteLine(prime);
            }
        }
    }
}
