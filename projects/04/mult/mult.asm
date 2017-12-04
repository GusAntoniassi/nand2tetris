// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
    // Armazenar o multiplicando em @num
    @R0
    D=M
    @num
    M=D

    // Inicializar o R2 em 0
    @R2
    M=0

    // Armazenar o multiplicador em @multiplicador
    @R1
    D=M
    @multiplicador
    M=D
    
    // Finalizar o programa se o multiplicador for 0
    @ENDLOOP
    D;JEQ

    // Armazenar o @num em @resultado
    @num
    D=M
    @resultado
    M=D


    // Declarar o @i
    @i
    M=1;

    // Loop: Enquanto i < multiplicador
    (LOOP)
        // if i >= multiplicador, JMP to END
        @multiplicador
        D=M
        @i
        D=D-M
        @END
        D;JLE // Ir pro END se multiplicador - i <= 0

        // Se chegou aqui, i < multiplicador
        @num
        D=M
        @resultado
        M=D+M
        
        // i++
        @i
        M=M+1

        // Voltar pro loop
        @LOOP
        0;JMP

    (END)
        // Aplicar o resultado no registrador R2
        @resultado
        D=M
        @R2
        M=D

    (ENDLOOP)
        @ENDLOOP
        0;JMP
    