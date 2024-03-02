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

(LOOP)

// Clear fill value
	@0
	D=A
	M=D

// Check keyboard
	@KBD
	D=M
	@FILL
	D;JEQ

// Set fill value
	D=-1
	@0
	M=D

(FILL)
// Set screen begin and end
	@8192
	D=A
	@SCREEN
	D=A+D
	@3
	M=D
	@SCREEN
	D=A
	@2
	M=D

(FILL_LOOP)
// Get next address
// Set pixels
	@0
	D=M
	@2
	A=M
	M=D

// Increment screen pointer
	D=A+1
	@2
	M=D

// Continue fill loop
	@3
	D=M-D
	@FILL_LOOP
	D;JGT

// Continue main loop
	@LOOP
	1;JMP
(END)
