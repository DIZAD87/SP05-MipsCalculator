#Class: CIS580
#Assignment: Lab#01
#Author: Daniel Izadnegahdar
#CsuID#: 2420596
#*****************************************
#Data segment
  .data
    intro01: .asciiz "Name: Daniel Izadnegahdar\n"
    intro02: .asciiz "Title: CIS580 Project#01\n"
    intro03: .asciiz "Description: MIPS program that performs basic arithmetic operations on 2 numbers:\n\n"   
    message01: .asciiz "Enter 2 numbers and I'll show you the sum, \n"
    message02: .asciiz "Difference, product, quotient, and remainder. \n\n"   
    message03: .asciiz "1st number: "
    message04: .asciiz "2nd number: "  
    symbol01: .asciiz " = " 
    symbol02: .asciiz " + " 
    symbol03: .asciiz " - "
    symbol04: .asciiz " X " 
    symbol05: .asciiz " / " 
    symbol06: .asciiz " R "  
    newLine: .asciiz "\n"
    goodbye: .asciiz "\n\nThese are your results, Goodbye!"
    sumVariable: .word 0 #sum variable, assigned to $s2
    subVariable: .word 0 #sub variable, assigned to $s3
    multVariable: .word 0 #mult variable, assigned to $s4
    quotientVariable: .word 0 #quotient variable, assigned to $s5
    remainderVariable: .word 0 #remainder variable, assigned to $s6
    
#*****************************************
#Text segment           
  .text 
  #print intro
    #print intro01
      li $v0, 4
      la $a0, intro01
      syscall
    #print intro02
      li $v0, 4
      la $a0, intro02
      syscall
    #print intro03
      li $v0, 4
      la $a0, intro03
      syscall
  #print basic prompts
    #Print message01
      li $v0, 4
      la $a0, message01
      syscall   
    #Print message02   
      li $v0, 4
      la $a0, message02
      syscall
  #Print user prompts
    #1st prompt
      #Print message03 
        li $v0, 4
        la $a0, message03
        syscall           
      #Read 1st number
        li $v0, 5
        syscall
        move $s0, $v0           
    #2nd prompt
      #Print message04
        li $v0, 4
        la $a0, message04
        syscall
      #Read 2nd number
        li $v0, 5        
        syscall
        move $s1,$v0
 #***************************************** 
  #Sum
    #newLine
      li $v0, 4
      la $a0, newLine
      syscall  
    #Print 1st value
      li $v0, 1
      move $a0, $s0
      syscall
    #Print operator
      li $v0, 4
      la $a0, symbol02
      syscall 
    #Print 2nd value
      li $v0, 1
      move $a0, $s1
      syscall
    #Print equal sign
      li $v0, 4
      la $a0, symbol01
      syscall
    #Print result
      add $s2, $s1, $s0
      sw $s2, sumVariable
      move $a0, $s2
      li $v0, 1
      syscall
 #***************************************** 
  #Difference
    #newLine
      li $v0, 4
      la $a0, newLine
      syscall                               
    #Print 1st value
      li $v0, 1
      move $a0, $s0
      syscall
    #Print operator
      li $v0, 4
      la $a0, symbol03
      syscall 
    #Print 2nd value
      li $v0, 1
      move $a0, $s1
      syscall
    #Print equal sign
      li $v0, 4
      la $a0, symbol01
      syscall
    #Print result
      sub $s3, $s0, $s1
      sw $s3, subVariable
      move $a0, $s3
      li $v0, 1
      syscall  
#*****************************************  
  #Multiplication
    #newLine
      li $v0, 4
      la $a0, newLine
      syscall                               
    #Print 1st value
      li $v0, 1
      move $a0, $s0
      syscall
    #Print operator
      li $v0, 4
      la $a0, symbol04
      syscall 
    #Print 2nd value
      li $v0, 1
      move $a0, $s1
      syscall
    #Print equal sign
      li $v0, 4
      la $a0, symbol01
      syscall
    #Print result
      mul $s4, $s1, $s0
      sw $s4, multVariable
      move $a0, $s4
      li $v0, 1
      syscall 
#*****************************************       
  #Division
    #newLine
      li $v0, 4
      la $a0, newLine
      syscall                               
    #Print 1st value
      li $v0, 1
      move $a0, $s0
      syscall
    #Print operator
      li $v0, 4
      la $a0, symbol05
      syscall 
    #Print 2nd value
      li $v0, 1
      move $a0, $s1
      syscall
    #Print equal sign
      li $v0, 4
      la $a0, symbol01
      syscall
    #Print quotient
      div $s5, $s0, $s1
      sw $s5, quotientVariable
      move $a0, $s5
      li $v0, 1
      syscall
    #Print remainder sign
      li $v0, 4
      la $a0, symbol06
      syscall
    #Print remainder
      rem $s6, $s0, $s1
      sw $s6, remainderVariable
      move $a0, $s6
      li $v0, 1
      syscall              
                                                                                           
#*****************************************      
  #Print message05   
      li $v0, 4
      la $a0, goodbye
      syscall    
  #Exit the program
    li $v0, 10 #10 is exit
    syscall   
