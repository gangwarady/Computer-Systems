#ADITYA SINGH GANGWAR
#2021CSM1001

#Kindly hard code the sizes of both the arrays in line 15 and 17 and starting address of both the arrays in line 9 and 10

.data
.word 4,7,8,9,10,25,36 							#ARRAY 1
.word 1,2,3,5,6,7,11,27 						#ARRAY 2
arr1add : .word 0x10000000 						#starting address of array 1
arr2add : .word 0x1000001C 						#starting address of array 2
finadd : .word 0x10001000						#starting address of final array

.text
lw x11 arr1add
addi x9 x0 7 									#size of array 1 
lw x12 arr2add
addi x10 x0 8 									#size of array 2
lw x13 finadd
L : 
lw x5 0(x11) 									#Load number from array 1
lw x6 0(x12)									#Load number from array 2
beq x9 x0 store_full_array2 					#if array 1 is finished,store all numbers from array 2 to final array
beq x10 x0 store_full_array1 					#if array 2 is finished,store all numbers from array 1 to final array
blt x5 x6 store_arr1 							#Number in Array 1 is less than number in Array 2, So store number from array 1 to final array
blt x6 x5 store_arr2							#Number in Array 2 is less than number in Array 1, So store number from array 2 to final array
beq x5 x6 store_arr1_arr2 						# When both the numbers are equal, So store both the numbers in final array


store_arr1: 
sw x5 0(x13) 									# store number from Array 1 to final array
addi x13 x13 4 									# Increment final array
addi x11 x11 4									#Increment array 1 to point to next number
addi x9 x9 -1 
beq x0 x0 L 									#Go back and check for next numbers

store_arr2:
sw x6 0(x13) 									# store number from Array 2 to final array
addi x13 x13 4 									# Increment final array
addi x12 x12 4 									#Increment array 2 to point to next number
addi x10 x10 -1
beq x0 x0 L 									#Go back and check for next numbers

store_arr1_arr2:
sw x5 0(x13) 									#Store number from Array 1 to final array
addi x13 x13 4 									#increment final array
addi x11 x11 4 									#Increment array 1 and point to next number
addi x9 x9 -1
sw x6 0(x13) 									# store number from Array 2 to final array
addi x13 x13 4 									#increment final array
addi x12 x12 4 									#Increment array 2 to point to next number
addi x10 x10 -1
beq x0 x0 L 									#Go back and check for next numbers

store_full_array2:
A2:
beq x10 x0 exit 								#if array 2 is also finished, exit
sw x6 0(x13)									# store number from Array 2 to final array
addi x13 x13 4  								# Increment final array
addi x12 x12 4 									#Increment array 2 to point to next number
addi x10 x10 -1
lw x6 0(x12)									#Load number from array 2
beq x0 x0 A2 									#continue loading until Array 2 is finished

store_full_array1:
A1:
beq x9 x0 exit 									#if array 1 is also finished, exit
sw x5 0(x13)									# store number from Array 1 to final array
addi x13 x13 4  								# Increment final array
addi x11 x11 4 									#Increment array 1 to point to next number
addi x9 x9 -1
lw x5 0(x11)									#Load number from array 2
beq x0 x0 A1									#continue loading until Array 1 is finished

exit: