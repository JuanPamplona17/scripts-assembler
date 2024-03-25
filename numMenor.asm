.data
prompt: .asciiz "Por favor ingresa un número: "
result_msg: .asciiz "El número menor es: "

.text
.globl main

main:
    # Reservar espacio en la pila para almacenar los números
    addi $sp, $sp, -12

    # Pide al usuario que ingrese los números
    la $a0, prompt
    li $v0, 4
    syscall

    # Lee el primer número
    li $v0, 5
    syscall
    move $t0, $v0   # Guardar el primer número

    # Lee el segundo número
    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0   # Guardar el segundo número

    # Lee el tercer número
    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t2, $v0   # Guardar el tercer número

    # Compara los números para encontrar el menor
    move $t3, $t0
    bgt $t1, $t3, mayor_t1
    move $t3, $t1
    mayor_t1:
    bgt $t2, $t3, mayor_t2
    move $t3, $t2
    mayor_t2:

    # Imprime el resultado
    la $a0, result_msg
    li $v0, 4
    syscall

    move $a0, $t3
    li $v0, 1
    syscall

    # Liberar espacio en la pila
    addi $sp, $sp, 12

    # Salir del programa
    li $v0, 10
    syscall