#ADITYA SINGH GANGWAR
#2021CSM1001


.data

p : .word 20					#enter number
q: .byte 0xff   				#
sadd : .word 0x10000000			#address where hexadecimal is stored
.text
lw x6 p							#load number in x6
lw x7 sadd						#load address of number in x7
lb a0 0(x7)						#load byte stored in 0x10000000 + 0 
lw a1 q							#load 0xff in a1
and a2 a1 x6					#and number with 0xff and store in a2
beq a2 a0 Little				#if(a2==a0) it is Little Endian 
addi x5 x0 1					#else Big endian, store 1 in x5
beq x0 x0 exit					#exit
Little:
add x5 x0 x0					#store 0 in x5 for Little Endian
exit: