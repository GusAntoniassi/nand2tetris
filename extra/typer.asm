(SETUP)
// Set the keyCode value for 0
@48
D=A
@keycodeZero
M=D

// Set the keyCode value for 9
@57
D=A
@keycodeNine
M=D

// Define the binary representation of the numbers, where 1s will be
// black pixels and 0s will be white pixels

// (0):
// 0010
// 0101
// 0101
// 0010
@9554 // This is the decimal representation of the binary above
D=A
@R0
M=D

// (1):
// 0010
// 0110
// 0010
// 0111
@9767
D=A
@R1
M=D

// (2):
// 0110
// 0001
// 0100
// 0111
@24903
D=A
@R2
M=D

// (3):
// 0110
// 0011
// 0001
// 0110
@25366
D=A
@R3
M=D

// (4):
// 0001
// 0101
// 0111
// 0001
@5489
D=A
@R4
M=D

// (5):
// 0111
// 0100
// 0001
// 0110
@29718
D=A
@R5
M=D

// (6):
// 0011
// 0100
// 0111
// 0111
@13431
D=A
@R6
M=D

// (7):
// 0111
// 0001
// 0010
// 0100
@28964
D=A
@R7
M=D

// (8):
// 0010
// 0111
// 0101
// 0010
@10066
D=A
@R8
M=D

// (9):
// 0011
// 0101
// 0111
// 0001
@13681
D=A
@R9
M=D

// Initialize X and Y cursor to 0
@whereX
M=0

@whereY
M=0


(WHILETRUE)
    // Store the current pressed key
    @KBD
    D=M
    @keyPressed
    M=D

    // If current keycode < 48, continue;
    @keyPressed
    D=M
    @48
    D=D-A
    @WHILETRUE
    D;JLT

    // If current keycode > 57, continue;
    @keyPressed
    D=M
    @57
    D=D-A
    @WHILETRUE
    D;JGT

    // currNumber = keycode - 48
    @keyPressed
    D=M
    @48
    D=D-A
    @currNumber
    M=D
    // currNumberBinary = @[keycode - 48]
    A=D
    D=M
    @currNumberBinary
    M=D

    So here is where it gets a little complicated
    First, we need to find the screen memory address that's at 
    whereX and whereY. After we get the address, we need to capture 
    its contents and store it in a variable, here we call "curr"
    
    Each memory register contains 16 bits of information, is 4 pixels 
    (or bits) wide, we can draw 4 numbers in each register.

    Knowing that, now we can deduce that whereY will be either the first,
    second, third or fourth number in the register.

    To know which position it is at, we can take whereY mod 4.

    After we know the position, we have to do three things:
        1) Clear the space in the register's contents so we can add our number
        (this is done by setting the four bits in that position to 0)
        2) For each line (each number contains 4 lines), we have to take
        
        
        fudeu

        verificar bit shifting

        curr[linha 0] = 0001 0101 1101 1011
        curr[linha 1] = 0101 0101 1101 1011
        curr[linha 2] = 0010 0101 1101 1011
        curr[linha 3] = 0111 0101 1101 1011
        5             = 0111 0100 0001 0110

        tem que dar um jeito de transformar o 5 em
        (linha 0): 0111 1111 1111 1111
        (linha 1): 0100 1111 1111 1111
        (linha 2): 0001 1111 1111 1111
        (linha 3): 0110 1111 1111 1111

        depois, tem que dar um jeito de fazer bit shifting dependendo do whereY
        então para whereY = 0
        (linha 0): 0111 1111 1111 1111
        (linha 1): 0100 1111 1111 1111
        (linha 2): 0001 1111 1111 1111
        (linha 3): 0110 1111 1111 1111

        para whereY = 1
        (linha 0): 1111 0111 1111 1111
        (linha 1): 1111 0100 1111 1111
        (linha 2): 1111 0001 1111 1111
        (linha 3): 1111 0110 1111 1111

        para whereY = 2
        (linha 0): 1111 1111 0111 1111
        (linha 1): 1111 1111 0100 1111
        (linha 2): 1111 1111 0001 1111
        (linha 3): 1111 1111 0110 1111

        para whereY = 3
        (linha 0): 1111 1111 1111 0111
        (linha 1): 1111 1111 1111 0100
        (linha 2): 1111 1111 1111 0001
        (linha 3): 1111 1111 1111 0110

        E aí depois é só juntar o setar o curr de cada linha com as linhas

    @WHILETRUE
    0;JMP


(ENDLOOP)
    @ENDLOOP
    0;JMP