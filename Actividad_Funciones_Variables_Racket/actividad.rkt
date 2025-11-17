#lang racket

;; Actividad: Funciones y Variables en Racket

;; Parte A – Comprensión básica

;; 1. Asociaciones simples: Explica qué valor tendrá cada variable después de evaluar estas expresiones:

(define a 5)
(define b (+ a 3))
(define c (* b 2))

;; a) ¿Cuál es el valor de a, b y c?
;; a = 5
;; b = 8   -> (a + 3 = 8)
;; c = 16   -> (b * 2 = 16)

;; b) ¿Qué pasaría si se define (define a 10) después? ¿Cambia b?
;; El valor de b no cambia porque b ya fue evaluado con el valor original de a, en racket las variables son inmutables.

;; 2. Sustitución simbólica: Evalúa paso a paso (por sustitución):

(define x 4)
(define (doble n) (* 2 n))
(define (suma3 m) (+ m 3))
(suma3 (doble x))

;; 1. x = 4
;; 2. (doble x) → (* 2 4) → 8
;; 3. (suma3 8) → (+ 8 3) → 11
;; 4. 11

;; 3. Definiciones equivalentes: ¿Son equivalentes las siguientes definiciones? Explica tu respuesta.

(define (cuadrado x) (* x x))
(define cuadrado-lambda (lambda (x) (* x x)))

;; Sí, son equivalentes. Ambas definen una función que calcula el cuadrado de un número x. 
;; La primera usa la sintaxis de definición de función, mientras que la segunda usa una expresión lambda para 
;; crear la misma función y asignarla a una variable.

;; Parte B – Aplicación práctica

;; 4. Área de un rectángulo: define dos variables base y altura, y una función (area base altura) que calcule el área.

(define base 10)
(define altura 5)

(define (area base altura)
  (* base altura))

(displayln (area base altura)) 

;; 5. Conversión de grados: define una función (celsius->fahrenheit c) que use F = (9/5)*C + 32.

(define (celsius->fahrenheit c)
  (+ (* (/ 9 5) c) 32))

(displayln (celsius->fahrenheit 25)) 

;; 6. Precio con impuesto: crea una variable precio-base, una función (iva monto) que calcule el 13% 
;; de un monto, y una función (precio-final p) que sume ambos.

(define precio-base 100)

(define (iva monto)
  (* monto 0.13))

(define (precio-final p)
  (+ p (iva p)))

(displayln (precio-final precio-base)) 

;; 7. Descuento encadenado: define (descuento10 p) y (iva13 p), luego una función (precio-total p) que aplique ambas en orden.

(define (descuento10 p)
  (* p 0.9)) ;; aplica 10% de descuento

(define (iva13 p)
  (* p 1.13)) ;; aplica 13% de IVA

(define (precio-total p)
  (iva13 (descuento10 p)))

(displayln (precio-total 100))


;; Parte C – Análisis y razonamiento

;; 8. Explica por qué no tiene sentido escribir (set! x (+ x 1)) en este paradigma.
;; Racket es un lenguaje funcional donde las variables son inmutables por defecto.
;; Usar (set! x (+ x 1)) intenta cambiar el valor de x, lo cual va en contra del principio
;; de inmutabilidad y puede llevar a errores y comportamientos inesperados en el código.

;; 9. Función como valor: analiza el siguiente código y responde:

(define sumar (lambda (a b) (+ a b)))
(define operar sumar)
    (operar 4 5)

;;  a) ¿Qué papel cumple operar? 
;; operar es otra referencia a la misma función que sumar.

;; b) ¿Por qué Racket permite esto?
;; Racket permite asignar funciones a variables porque las funciones son valores de primera clase.
;; Esto significa que pueden ser pasadas como argumentos, retornadas desde otras funciones y asignadas a variables.

;; 10. Diferencia entre (define x 5) y (define (x) 5): explica conceptualmente.
;; (define x 5)  → variable llamada x con valor 5.
;; (define (x) 5) → función sin parámetros que devuelve 5 al ser llamada

;; Parte D – Desafío final (integrador)

;; Crea una función (calcular-total precio descuento impuesto) que primero aplique el descuento, luego
;; sume el impuesto y devuelva el valor final.
;; Ejemplo: (calcular-total 100 0.1 0.13) ⇒ 101.7

(define (calcular-total precio descuento impuesto)
  (let* ((precio-descuento (* precio (- 1 descuento)))
         (precio-final (+ precio-descuento (* precio-descuento impuesto))))
    precio-final))

(displayln (calcular-total 100 0.1 0.13)) 




