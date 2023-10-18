// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// pseudo code
// if R0 >= 0 GOTO END;
// if R1 >= 0 GOTO END;
// if sum > 32768 GOTO END;
// r2 = r0 * r1
// LOOP
// if i < r1
// sum = sum + r0
// i = i + 1

// declare sum and i
@i
M=1
@sum
M=0
(LOOP)
// if (i > R1) goto STOP
@i
D=M
@R1
D=D-M
@STOP
D;JGT
//sum = sum + R0
@sum
D=M
@R0
D=D+M
@sum
M=D
// i = i + 1
@i
M=M+1
@LOOP
0;JMP
(STOP)
@sum
D=M
@R2
M=D
(END)
@END
0;JMP
