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
// infinite loop
// if keyboard is pressed
// clear screen with black pixels
// else 
// clear with white pixels

@SCREEN
D=A
@CURSOR
M=D

@8192
D=A
@SCREEN
D=D+A
@size
M=D

(LOOP)
@KBD
D=M
@CLEARW
D;JEQ // if compare > 0
@CLEARB
0;JMP

(CLEARW)
@COLOR
M=0
@FILL
0;JMP

(CLEARB)
@COLOR
M=-1
@FILL
0;JMP

(FILL)
@COLOR
D=M
@CURSOR
A=M
M=D
@CURSOR
M=M+1
D=M
@size
D=D-M
@RESETCURSOR
D;JGT
@LOOP
0;JMP

(RESETCURSOR)
@SCREEN
D=A
@CURSOR
M=D
@LOOP
0;JMP
