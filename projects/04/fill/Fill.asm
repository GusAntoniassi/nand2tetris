// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// var lastpress = 0
// while (true) {
//     var currpress = read(KBD)
//     var whichfill = 0;
//     if (currpress > 0) {
//         whichfill = -1;
//     }
//     // preencher a tela
//     for (i = 0; i < @KBD; i++) {
//        screen[i] = whichfill;
//     }
// }

    @lastpress
    M=0

    (WHILETRUE)
        // Lê o valor do KBD e armazena na variável currpress
        @KBD
        D=M
        @currpress
        M=D

        @SETFILLBLACK
        M;JGT

        // else
        @FILLSCREENLOOP
        0;JMP

    // Seta a variável @whichfill como -1
    (SETFILLBLACK)
        @whichfill
        M=-1
        @FILLSCREENLOOP
        0;JMP

    // for (i = 0; i < @KBD; i++)
    (FILLSCREENLOOP)
        // set i = 0
        @i
        M=0
        D=M
        (LOOP)
            @i
            D=M
            // if (i < @KBD)
            @KBD
            D=D-A
            // encerrar o loop (voltar pro while) se i - @KBD < 0
            @WHILETRUE
            D;JLT

            // if (whichfill == 0) { JMP @FILLSCREENWHITE }
                @whichfill
                D=M
                @FILLSCREENWHITE
                D;JEQ
            // else            
                // Preenche a tela com a cor preta
                @i
                D=M
                @SCREEN
                A=D+A
                M=-1
                @LOOPEND
                0;JMP

            // Preenche a tela com a cor branca
            (FILLSCREENWHITE)
                @i
                D=M
                @SCREEN
                A=D+A
                M=0
                @LOOPEND
                0;JMP
            
           (LOOPEND)
           @i
           M=M+1
           @LOOP
           0;JMP
