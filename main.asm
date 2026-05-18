.data
str1: .asciiz "Digite o valor de X: "
erro: .asciiz "Erro: Nao eh um quadrado perfeito.\n"
pergunta: .asciiz "Deseja digitar novo numero? (1-Sim, 0-Nao): "
raiz_str: .asciiz ": raiz "
newline: .asciiz "\n"

	.align 2
vetor_x: .space 40
vetor_r: .space 40

	.text
	.globl main
main:
	li $s5, 0

leitura_x:
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 5
	syscall
	move $s0, $v0

	li $s1, 1
	li $s2, 2
	li $s3, 4
	li $s4, 0

while:
	addi $s1, $s1, 1
	addi $s2, $s2, 2
	add $s3, $s3, $s2
	addi $s3, $s3, 1

	slt $t2, $s0, $s3
	beq $t2, $zero, manter_zero
	li $s4, 1

manter_zero:
	beq $s4, $zero, while

	mul $t3, $s1, $s1
	beq $t3, $s0, eh_perfeito

	li $v0, 4
	la $a0, erro
	syscall
	j leitura_x

eh_perfeito:
	sll $t0, $s5, 2
	sw $s0, vetor_x($t0)
	sw $s1, vetor_r($t0)
	addi $s5, $s5, 1

	li $t1, 10
	beq $s5, $t1, relatorio

	li $v0, 4
	la $a0, pergunta
	syscall
	li $v0, 5
	syscall
	beq $v0, $zero, relatorio
	j leitura_x

relatorio:
	li $t0, 0

loop_print:
	beq $t0, $s5, encerrar
	sll $t1, $t0, 2

	lw $a0, vetor_x($t1)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, raiz_str
	syscall

	lw $a0, vetor_r($t1)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	addi $t0, $t0, 1
	j loop_print

encerrar:
	li $v0, 10
	syscall
