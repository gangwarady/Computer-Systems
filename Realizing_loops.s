#ADITYA SINGH GANGWAR
#2021CSM1001

.data
addr: .word 0x10001000
n: .word 1 -2 3 4 5 -6 7 8 78


.text
lw x10 addr
lw x14 addr
la x15 n
addi x11 x0 9 			#size of array
add x13 x0 x0
add x5 x0 x0
L1: beq x5 x11 for		#store array at 0x10001000
lw x6 0(x15)
sw x6 0(x14)
addi x15 x15 4
addi x14 x14 4
addi x5 x5 1
beq x0 x0 L1

for: beq x11 x0 exit	#for loop
lw x12 0(x10)
add x13 x13 x12			#add
addi x10 x10 4
addi x11 x11 -1
beq x0 x0 for


exit:
