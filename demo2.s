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

	# print newline
	la $a0, nl
	syscall

	# read user input into user_input
	li $v0, 8
	la $a0, user_input
	li $a1, 65
	syscall

	# print newline
	li $v0, 4
	la $a0, nl
	syscall

	# print greeting1
	la $a0, greeting1
	syscall

	# print user_input
	la $a0, user_input
	syscall

	# print greeting2
	la $a0, greeting2
	syscall

	li $v0, 10 #exit the program 
	syscall
