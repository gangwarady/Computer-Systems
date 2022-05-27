#ADITYA SINGH GANGWAR
#2021CSM1001


.data
n: .word 0x10001000
sorted: .word 0x10002000
size: .word 15
elements: .word 9 8 7 6 5 4 3 2 1 10 11 27 13 50 12

.text
lw x4 sorted		#address where sorted array will be stored
lw x11 size			#load size	
la x12 elements  	#load elements address
lw x13 n			#load starting address of array
add x10 x0 x0		
for: bge x10 x11 L	#for loop for storing array to 0x10001000
lw x5 0(x12)		
addi x12 x12 4
addi x10 x10 1
sw x5 0(x13)
addi x13 x13 4
beq x0 x0 for
L: jal ra ss
beq x0 x0 exit


ss: la x13 elements #selection sort
addi x19 x11 1
addi x10 x0 1
add x14 x13 x0
for2: bge x10 x19 comeout2
lw x6 0(x14) #set current element as min
add x15 x10 x0
addi x16 x14 4
for3: bge x15 x11 comeout3  #come out of the loop
lw x17 0(x16) 
bge x17 x6 L2 #compare with min
add x6 x17 x0 #store new min
add x18 x16 x0 #store address of minimum element
L2: addi x15 x15 1
addi x16 x16 4 #store min
beq x0 x0 for3
comeout3: lw x3 0(x14) #load starting element
beq x6 x3 skip  #if equal do not store the element
sw x3 0(x18)
skip:sw x6 0(x4) #store in sorted array address
addi x4 x4 4
addi x10 x10 1
addi x14 x14 4
beq x0 x0 for2
comeout2: jalr x0 ra 0

exit: