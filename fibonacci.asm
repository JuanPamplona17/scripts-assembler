.data
prompt: .asciiz "Introduce el número de términos de la serie Fibonacci: "
result: .asciiz "La serie Fibonacci es: "
separator: .asciiz ", "

.text
.globl main

main:
    # Imprimir el mensaje de solicitud
    li $v0, 4            # Cargar el código del servicio de impresión de cadena
    la $a0, prompt       # Cargar la dirección de la cadena
    syscall              # Llamar al servicio de impresión de cadena

    # Leer el número de términos de la serie
    li $v0, 5            # Cargar el código del servicio de lectura de enteros
    syscall              # Llamar al servicio de lectura de enteros
    move $s0, $v0        # Almacenar el número de términos en $s0

    # Inicializar los primeros dos términos de la serie
    li $t0, 0            # Primer término de la serie (F0)
    li $t1, 1            # Segundo término de la serie (F1)

    # Imprimir el mensaje del resultado
    li $v0, 4            # Cargar el código del servicio de impresión de cadena
    la $a0, result       # Cargar la dirección de la cadena
    syscall              # Llamar al servicio de impresión de cadena

    # Mostrar los primeros dos términos
    move $a0, $t0        # Cargar el primer término para imprimir
    li $v0, 1            # Cargar el código del servicio de impresión de enteros
    syscall              # Llamar al servicio de impresión de enteros
    li $v0, 4            # Cargar el código del servicio de impresión de cadena
    la $a0, separator    # Cargar la dirección del separador
    syscall              # Llamar al servicio de impresión de cadena
    move $a0, $t1        # Cargar el segundo término para imprimir
    li $v0, 1            # Cargar el código del servicio de impresión de enteros
    syscall              # Llamar al servicio de impresión de enteros

    # Calcular y mostrar los siguientes términos de la serie
    addi $s0, $s0, -2    # Decrementar el número de términos por mostrar los dos primeros términos ya mostrados
    blez $s0, end_loop   # Saltar al final del bucle si no hay más términos por mostrar

    # Bucle para calcular y mostrar la serie de Fibonacci
fib_loop:
    add $t2, $t0, $t1    # Calcular el siguiente término: F(n) = F(n-1) + F(n-2)
    move $t0, $t1        # Actualizar F(n-2) con el valor de F(n-1)
    move $t1, $t2        # Actualizar F(n-1) con el valor del término calculado
    li $v0, 4            # Cargar el código del servicio de impresión de cadena
    la $a0, separator    # Cargar la dirección del separador
    syscall              # Llamar al servicio de impresión de cadena
    move $a0, $t2        # Cargar el término calculado para imprimir
    li $v0, 1            # Cargar el código del servicio de impresión de enteros
    syscall              # Llamar al servicio de impresión de enteros
    addi $s0, $s0, -1    # Decrementar el contador de términos
    bgtz $s0, fib_loop   # Saltar de nuevo al bucle si quedan más términos por mostrar

end_loop:
    # Salir del programa
    li $v0, 10           # Cargar el código del servicio de salida
    syscall              # Llamar al servicio de salida