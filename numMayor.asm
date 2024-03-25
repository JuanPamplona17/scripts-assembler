.data
    prompt:     .asciiz "Ingrese un número: "
    result:     .asciiz "El número mayor es: "
    newline:    .asciiz "\n"
    
.text
    main:
        # Reservar espacio en la pila para almacenar los números
        addi $sp, $sp, -12

        # Pedir al usuario que ingrese los números
        la $a0, prompt
        li $v0, 4
        syscall

        # Leer el primer número
        li $v0, 5
        syscall
        move $t0, $v0    # Guardar el primer número en $t0

        # Pedir al usuario que ingrese el segundo número
        la $a0, prompt
        li $v0, 4
        syscall

        # Leer el segundo número
        li $v0, 5
        syscall
        move $t1, $v0    # Guardar el segundo número en $t1

        # Pedir al usuario que ingrese el tercer número
        la $a0, prompt
        li $v0, 4
        syscall

        # Leer el tercer número
        li $v0, 5
        syscall
        move $t2, $v0    # Guardar el tercer número en $t2

        # Comparar los números para encontrar el mayor
        move $t3, $t0    # Suponemos que el mayor es el primer número
        bgt $t1, $t3, check_t1    # Si $t1 > $t3, ir a check_t1
        bgt $t2, $t3, check_t2    # Si $t2 > $t3, ir a check_t2
        j print_result    # Ir a imprimir el resultado

    check_t1:
        move $t3, $t1    # Si estamos aquí, $t1 es el nuevo candidato a mayor
        bgt $t2, $t3, check_t2    # Si $t2 > $t3, ir a check_t2
        j print_result    # Ir a imprimir el resultado

    check_t2:
        move $t3, $t2    # Si estamos aquí, $t2 es el nuevo candidato a mayor

    print_result:
        # Imprimir el número mayor
        la $a0, result
        li $v0, 4
        syscall

        move $a0, $t3    # Cargar el número mayor en $a0
        li $v0, 1
        syscall

        # Imprimir una nueva línea
        la $a0, newline
        li $v0, 4
        syscall

        # Restaurar la pila y salir del programa
        addi $sp, $sp, 12
        li $v0, 10
        syscall
