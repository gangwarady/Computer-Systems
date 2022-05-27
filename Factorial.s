#ADITYA SINGH GANGWAR
#2021CSM1001





.text
addi x10 x0 5		#value of n
addi x5 x0 1
beq x10 x0 exit		#if n=0  exit
beq x10 x5 exit		#if n=1  exit
jal ra fact
lw x5 0(sp)			#store final factorial value into register x5 and exit
beq x0 x0 exit

fact:beq x10 x5 Return1  #if n=1 return 1
addi sp sp -8
sw ra 8(sp)
sw x10 4(sp)
addi x10 x10 -1
jal ra fact
lw x6 0(sp)
lw x7 8(sp)
mul x6 x6 x7  #n*fact(n-1)
sw x6 8(sp)
addi sp sp 8
lw ra 4(sp)
jalr x0 ra 0



Return1: addi sp sp 4
jalr x0 ra 0

exit:
