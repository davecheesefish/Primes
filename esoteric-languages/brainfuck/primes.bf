0 isPrime flag
1 Working space
2 Candidate
3 Current divisor
4 to 8 Division working area
    4 Dividend
    5 Divisor
    6 (output) Modulus
    7 (output) Result
    8 Working area
    9 Working area
Numbers indicate the memory cell each line leaves the pointer at



Set candidate to 2
>>++  2

Set prime flag to 1
<<+  0

>>  2
[

    Copy candidate to divisor
    [-<+>]<[->+>+<<]  1
    >>--  3

    Only do the following if the divisor is not 0
    [
        Increment so net decrement of divisor is 1
        +

        Clear out division area
        >>>>>>[-]<[-]<[-]<[-]<[-]<[-]  4

        Copy candidate and divisor into division working area
        <<[<+>>>+<<-]<[>+<-]  1
        >>[<<+>>>>+<<-]<<[>>+<<-]  1

        Perform division
        Cell 6 will contain the modulus
        If it is 0 the candidate is not prime
        https://esolangs org/wiki/brainfuck_algorithms#Divmod_algorithm
        >>>  4
        [->-[>+>>]>[+[-<+>]>+>>]<<<<<]  4
        >>  6

        If the modulus is 0 set the isPrime flag to 0
        Move modulus to cell 8
        [->>+<<]  6
        Set cell 9 to 1 and cell 10 to 0
        >>>[-]+>[-]<<  8
        If modulus in cell 8 is nonzero move to cell 10; cell 9 is set to 0 in the process to stop a loop occurring
        Else move to cell 9; cell 9 remains set to 1
        [>-]>  9 containing 1 or 10 containing 0
        If the current cell is nonzero we are in cell 9 and the modulus in cell 8 was 0; Set the flag in cell 0
        [
            <<<<<<<<<[-]>>>>>>>>>  9
            Move to cell 10 to bring us back in line with the other path
            >  10
        ]
        Both paths end here in cell 10

        Go back to the divisor in cell 3
        <<<<<<<  3

        Decrement divisor by 2
        --

        If the divisor is 0 execution will fall out of the loops below
    ]

    Check isPrime flag in cell 0
    <<<  0
    [
        If nonzero ouput candidate
        Since BF can only output single chars we must work out the charcodes
        to output all digits of the full number

        Clear out division area
        >>>>[-]>[-]>[-]>[-]>[-]>[-] 9

        Copy candidate to cell 4
        <<<<<<<  2
        [<+>-]<[>+>>+<<<-]>  2

        Set cell 5 to 100
        Set cell 6 to 10; loop and increment cell 5 by 10 while
        decrementing cell 6 by 1 until cell 6 is 0
        >>>>++++++++++[<++++++++++>-]<<  4

        Perform division as earlier
        [->-[>+>>]>[+[-<+>]>+>>]<<<<<]  4

        Store result in cell 10; this is the number of hundreds
        >>>[>>>+<<<-]  7

        Move modulus to cell 4; this is the number of tens and units
        <[<<+>>-]  6

        Set cell 5 to 10
        <[-]++++++++++  5

        Zero out cells 7 to 9
        >>[-]>[-]>[-]  9
        <<<<<  4

        Divide again
        [->-[>+>>]>[+[-<+>]>+>>]<<<<<]  4

        The result in cell 7 is the number of tens; the modulus in cell
        6 is the number of units; the number of hundreds was stored in
        cell 10 earlier

        Move cell 6 to cell 12 and cell 7 to cell 11
        >>[>>>>>>+<<<<<<-]  6
        >[>>>>+<<<<-]  7

        Set cell 9 to 48; The ASCII offset of the 0 character
        >[-]++++++[>++++++++<-]  8

        Set cell 13 to 0; this will be used for commas
        >>>>>[-]  13

        Add 48 to cells 10 11 12 and 13
        <<<<[>+>+>+>+<<<<-]  9

        Decrement cell 13 by 4 for the ASCII comma character
        >>>>----  13
        <<<  10

        Output and zero cells 10 to 13
        .[-]>.[-]>.[-]>.[-]  13

        Zero the isPrime flag in cell 0
        <<<<<<<<<<<<<[-]  0
    ]
    Reset isPrime flag to 1
    +

    Increment candidate by 1
    >>+  2

    If the candidate reaches its max value and loops to 0 the program will end
]


