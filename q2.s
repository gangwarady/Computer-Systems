#ADITYA SINGH GANGWAR
#2021CSM1001

#I am storing size of the queue in a5 register

.data
sadd : .word  0x10001000  						#starting address of queue
enq: .asciiz  "E 20 E 12 E 9 D D S E 23 "  		# Kindly end the sequence operations with a single "space".

seqadd: .word 0x10000004  						#starting address of our operations
.text
li x28 'E'  	#E
li x29 'D'		#D
li x30 'S'		#S
li x31 ' '		#space

addi a6 x0 10
lw x7 sadd  		#head
lw x6 sadd			#tail
lw x5 seqadd
L: 
lb a0 0(x5)  		#load operation
beq a0 x0 exit  	#if no operations left then exit
addi x5 x5 2
beq a0 x28 ENQUEUE
beq a0 x29 DEQUEUE
beq a0 x30 SIZE

ENQUEUE:
lb a1 0(x5) 				#load number
addi a1 a1 -48
check : addi x5 x5 1 		#increase seqadd
lb a3 0(x5) 				#check next byte
bne a3 x31 NOT_SPACE		# check if Next byte is not space
addi x5 x5 1
sw a1 0(x6) 				#store number
addi x6 x6 4 				#tail increased
beq x0 x0 L
DEQUEUE : 
lw x8 sadd 					#temp pointer
addi x6 x6 -4 				#tail decreased
D : addi x9 x8 4 			#next byte
lb a2 0(x9)					#load value from next byte
beq a2 x0 L					#if shifting is finsihed go back to L
sw a2 0(x8) 				#store number from x9 to x8
sw x0 0(x9) 				#make x9=0
addi x8 x8 4 				#temp pointer increased
beq x0 x0 D 				#shift all the elements towards head
SIZE :
addi a4 x0 4 				#a4=4
sub  a5 x6 x7 				#subtract tail-head and store in a5
div a5 a5 a4  				#Divide a5 by 4 and size is stored in a5 register
beq x0 x0 L
NOT_SPACE:					#Next byte is space
addi a3 a3 -48
mul a1 a1 a6				#Mul by 10
add a1 a1 a3				#add the other number to result a1
beq x0 x0 check

exit: