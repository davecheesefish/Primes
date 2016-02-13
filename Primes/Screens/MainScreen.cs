using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Primes.Screens
{
    /// <summary>
    /// The main menu of the program.
    /// </summary>
    static class MainScreen
    {
        /// <summary>
        /// Shows the main menu.
        /// </summary>
        public static void Show()
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
                try
                {
                    // Convert input to int.
                    input = int.Parse(inputStr);
                }
                catch (FormatException)
                {
                    // Input was not a number. Flag input as invalid.
                    isValidInput = false;
                }

                // Make sure input is a sane number.
                if (isValidInput && (input < 0 || input > 200))
                {
                    isValidInput = false;
                }

                if (!isValidInput)
                {
                    // Input was invalid. The do...while loop will restart.
                    Console.WriteLine("Invalid selection.");
                }
            } while (!isValidInput);
            
            // Temporary output
            Console.WriteLine(input);
        }
    }
}
