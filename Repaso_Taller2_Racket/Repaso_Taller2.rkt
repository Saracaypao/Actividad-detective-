#lang racket


;;1. una funcion que recibe una lista como argumento y devuelve la suma de 
;todos sus componentes
(define (sumlist lst)
  (foldl + 0 lst))

(printf "Suma total: ~a\n" (sumlist '(1 2 3 4 5)))
;; Salida: Suma total: 15

;;2. funcion que recibe lista y devuelve los numeros mayores que n (en este caso 4 )
(define (greaterthan lst n)
  (filter (lambda (x) (> x n)) lst))

(printf"Mayores que 4: ~a\n" (greaterthan '(5 3 8 1 10) 4))
;; Salida: Mayores que 4: (5 8 10)

;;3. funcion que recibe una lista y devuelve el producto de sus componentes
(define (producto-lista lst)
  (foldl * 1 lst))

(printf"Producto total: ~a\n" (producto-lista '(2 3 4)))
;; Salida: Producto total: 24

;;4.
; función de duplicado
(define (dupvlist x)
  (* 2 x))

;;función que recibe una función y una lista
(define (applyfd f lst)
  (map f lst)) 

(printf "Duplicar todos: ~a\n" (applyfd dupvlist '(1 2 3 4)))
;; Salida esperada: (2 4 6 8)

;;5. funcion para calcular sqr
(define (cuadrado x)
  (* x x))

;;6. cada elemento de la lista al cuadrado
(define (lstsqr lst)
  (map cuadrado lst))

(printf "Cuadrados: ~a\n" (lstsqr '(1 2 3 4 5)))
;; Salida esperada: (1 4 9 16 25)

;;7 filtro de numeros pares
(define (evens lst)
  (filter (lambda (x) (even? x)) lst))

(printf "Numeros pares: ~a\n" (evens '(1 2 3 4 5 6)))
;; Salida esperada: (2 4 6)

;;8. promedio de nuemeros
(define (promedio lst)
  (if (null? lst)       ; validacion de division /0 (no necesaria pero para fines didacticos etc) 
      0
      (/ (foldl + 0 lst)
         (length lst))))

(printf "Promedio: ~a \n" (promedio '(4 6 8 10)))
;; Salida esperada: 7.0

;;9. elevar a elementos listados a la n potencia

(define (elevar-lista lst n)
  (map (lambda (x) (expt x n)) lst))

(printf "Elementos elevados a ~a: ~a\n" 2 (elevar-lista '(2 3 4) 2))
;; Salida esperada: (4 9 16)

;;10 cantidad de elementos mayor a n en una lista
(define (ctgreater lst n)
  (length (filter (lambda (x) (> x n)) lst)))

(printf "Cantidad mayores que 6: ~a\n" (ctgreater '(5 7 2 9 1 10) 6))
;; Salida esperada: 3

;;11. aplicacion de una funcion 2 veces 
(define (2tf f x)
  (f (f x)))

(printf "Resultado: ~a\n" (2tf sqrt 16))
;; Salida esperada: 2.0

;;12. producto de numeros mayores a 5 
(define (multgreaterthan lst)
  (foldl * 1 (filter (lambda (x) (> x 5)) lst))) 
  ;; foldl hace la multiplicacion de todos los elementos restantes que se han filtrado
  ;; la condicion de mayor a 5 es corrida primero  

(printf "Producto de mayores a 5: ~a\n" (multgreaterthan '(2 5 6 8 3 10)))
;; Salida esperada: 480