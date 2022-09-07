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


#The text section contains the instructions to execute. Most of your time will be spent in the .text section. The text section must have a main: label to function properly
.text

#the main: label tells SPIM where to begin progam execution
main:

	li $v0, 10 #exit the program 
	syscall
