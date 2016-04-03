using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace Primes
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void generateButton_Click(object sender, EventArgs e)
        {
            // Clear the output box.
            outputTextBox.Clear();
            
            // Get the primes specified by the options.
            List<int> primes = PrimeCalculator.GetFirstPrimes((int)maxNumberNumericUpDown.Value);

            // Output them.
            foreach (int prime in primes)
            {
                outputTextBox.AppendText(prime.ToString() + "\n");
            }
        }
    }
}
