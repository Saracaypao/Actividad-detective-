#lang racket

; a)
;1a.
(define a 5)
;(define a 10) --En racket no se puede hacer una redefinicion de una variable, 
  ;algo parecido seria utilizar set!, que si bien no es una redfinicion si no 
  ;que enlaza otro valor a la variable
(define b (+ a 3))
(define c (* b 2))

(printf "a = ~a, b = ~a, c = ~a\n" a b c)

;2a.
(define x 4) ; x = 4
(define (doble n) (* 2 n))  ;2*n
(define (suma3 m) (+ m 3))  ;m+3
(suma3 (doble x))           ;(2*n)+3

(printf "x*2 = ~a\n" (suma3 (doble x))); 11

;3a.

(define (cuadrado x) (* x x))
(define cuadrado2 (lambda (x) (* x x)))

(printf "cuadrado: ~a, cuadrado2: ~a\n" (cuadrado 5) (cuadrado2 5))

;las dos formas se comportan igual, la primera es "azucar sintáctica" y la segunda 
;es la forma original de como escribir la funcion

;b)
;4b. Área de un rectángulo

;; Definimos las variables base y altura
(define base 5)
(define altura 3)

;; Definimos la función area
(define (area base altura)
  (* base altura))

(printf"Área del rectángulo: ~a" (area base altura)))


; 5b. Conversión de grados Celsius a Fahrenheit

(define (celsius->fahrenheit c)
  (+ (* (/ 9 5) c) 32))

(printf"25 °C equivalen a ~a °F" (celsius->fahrenheit 25)))


; 6b. Precio con impuesto

; Variable del precio base
(define precio-base 100)

; Función para calcular el IVA (13%)
(define (iva monto)
  (* monto 0.13))

; Función para calcular el precio final con impuesto
(define (precio-final p)
  (+ p (iva p)))

(printf"Precio final con IVA: $~a" (precio-final precio-base)))


; 7b. Descuento encadenado
;; Función de descuento del 10%

(define (descuento10 p)
  (- p (* p 0.10)))

;; Función IVA del 13%
(define (iva13 p)
  (+ p (* p 0.13)))

;; Función total que aplica descuento y luego IVA
(define (precio-total p)
  (iva13 (descuento10 p)))

(printf"Precio total después de descuento e IVA: $~a"
                   (precio-total 200)))

;c)  
;c1
(set! x (+ x 1))
;esto rompe con el principio de inmutabilidad del paradigma funcional
;En el paradigma funcional, el objetivo no es modificar valores, sino crear nuevos valores 
;a partir de los anteriores, sin alterar el estado del programa existente.

(define sumar (lambda (a b) (+ a b)))
(define operar sumar) 
(operar 4 5)
(printf "operar: ~a"(operar 4 5))

;operar no es una nueva función ni una copia, sino que es una funcion que incorpora sumar 
;y apunta al mismo valor funcional.

;Racket es un lenguaje funcional de primera clase, lo que significa que:
;Las funciones son valores como cualquier otro.

;Esto implica que se puede guardarlas en variables, pasarse como argumentos, devolverse
;desde otras funciones y Asignarlas a varios nombres (como aquí).

(define y 5)
;Asocia el nombre x con el valor 5.
;x es una variable (una constante en el sentido funcional).

(define (z) 5)
;Es una función sin argumentos que, cuando se llama, devuelve 5.
;Aquí x no es una variable apuntando a un número, sino una función que produce un número.

; funcion que aplica descuento e impuesto en orden
(define (calcular-total precio descuento impuesto)
  (let* ((precio-descuento (- precio (* precio descuento)))
         (precio-final (+ precio-descuento (* precio-descuento impuesto))))
    precio-final))

; Ejemplo de uso:
(printf"Precio final ( descuento antes que impuesto): $~a"
                   (calcular-total 100 0.10 0.13)))

