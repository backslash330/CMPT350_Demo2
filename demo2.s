#################################
# Demo 2                        #
# Author: Nicholas Almeida      #
# Date: September 07, 2022      #
#                               #
# Purpose: This program takes   #
# in as input a user's name,    #
# greets them, modifies their   #
# name to be all lowercase and  #
# all uppercase, and tell them  #
# the last character of their   #
# name.                         # 
################################# 

#The data section reserves memory locations for future reference in the program. Commonly used for strings and arrays
.data
	user_input: .space 64
	instructions: .asciiz "Please enter your name: "
	greeting1: .asciiz "Hello "
	greeting2: .asciiz ", I will modify your name."
	upper_label: .asciiz "Your name in all uppercase is: "
	lower_label: .asciiz "Your name in all lowercase is: "
	nl: .asciiz "\n"


#The text section contains the instructions to execute. Most of your time will be spent in the .text section. The text section must have a main: label to function properly
.text

#the main: label tells SPIM where to begin progam execution
main:
	# print instructions
	li $v0, 4
	la $a0, instructions
	syscall

	# read user input into user_input
	li $v0, 8
	la $a0, user_input
	li $a1, 65
	syscall

	# print greeting1
	li $v0, 4
	la $a0, greeting1
	syscall

	# loop through and print user_input as chars up to the first newline character
	# $t0 is used as a counter
	li $t0, 0
user_input_loop:
	# load the current character into $t1
	lb $t1, user_input($t0)
	# exit the loop before a newline character is printed
	beq $t1, 10, user_input_loop_end

	# print the current character
	li $v0, 11
	move $a0, $t1
	syscall

	# increment the counter
	addi $t0, $t0, 1
	j user_input_loop
user_input_loop_end:

	# print greeting2
	li $v0, 4
	la $a0, greeting2
	syscall

	# print new line
	li $v0, 4
	la $a0, nl
	syscall

	# print upper_label
	li $v0, 4
	la $a0, upper_label
	syscall

	# loop through user_input and print each character in uppercase
	# $t0 is used as a counter
	li $t0, 0
user_input_upper_loop:
	# load the current character into $t1
	lb $t1, user_input($t0)
	beq $t1, 0, user_input_upper_loop_end #exit at the end of the string

	# check if the character is lowercase
	# if the character is lowercase, subtract 32 to make it uppercase
	# if the character is uppercase, do nothing

	# check if the character is lowercase
	# if the character is lowercase, subtract 32 to make it uppercase
	# if the character is uppercase, do nothing
	li $t2, 97
	blt $t1, $t2, user_input_upper_loop_not_lowercase
	li $t2, 122
	bgt $t1, $t2, user_input_upper_loop_not_lowercase
	sub $t1, $t1, 32

user_input_upper_loop_not_lowercase:
	# print the current character
	li $v0, 11
	move $a0, $t1
	syscall

	# increment the counter
	addi $t0, $t0, 1
	j user_input_upper_loop
user_input_upper_loop_end:

	# print lower_label
	li $v0, 4
	la $a0, lower_label
	syscall

	# loop through user_input and print each character in lowercase
	# $t0 is used as a counter
	li $t0, 0
user_input_lower_loop:
	# load the current character into $t1
	lb $t1, user_input($t0)
	beq $t1, 0, user_input_lower_loop_end #exit at the end of the string

	# check if the character is uppercase
	# if the character is uppercase, add 32 to make it lowercase
	# if the character is lowercase, do nothing
	li $t2, 65
	blt $t1, $t2, user_input_lower_loop_not_uppercase
	li $t2, 90
	bgt $t1, $t2, user_input_lower_loop_not_uppercase
	add $t1, $t1, 32

user_input_lower_loop_not_uppercase:
	# print the current character
	li $v0, 11
	move $a0, $t1
	syscall

	# increment the counter
	addi $t0, $t0, 1
	j user_input_lower_loop
user_input_lower_loop_end:

	li $v0, 10 #exit the program 
	syscall
