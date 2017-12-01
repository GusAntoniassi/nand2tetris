// Adds up two numbers
// RAM[2] = RAM[0] + RAM[1]
// Usage: put the values to be added in RAM[0] and RAM[1]

	@0
	D=M
	
	@1
	D=D+M
	
	@2
	M=D