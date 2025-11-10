#lang racket

;1.
(define (contar-pares lst)
  (length (filter even? lst)))

(printf"Cantidad de pares: ~a" (contar-pares '(1 2 3 4 5 6))))

;2.
(define (suma-cuadrados lst)
  (apply + (map sqr lst)))

(printf"Suma de cuadrados: ~a" (suma-cuadrados '(1 2 3 4))))

;2/2.
(define (suma-cuadrados2 lst)
  (foldl (lambda (x acc) (+ acc (sqr x))) 0 lst))
(printf "suma de cuadrados: ~a" (suma-cuadrados2 '(1 2 3 4)))

;3
;definicion de funcion
(define halfamult (lambda (x) (* x 1.5)) )
(printf "halfamult: ~a\n" (halfamult 4))

(define (procesar-lista lst f)
  (list
    lst ;devuelve la lista por defecto
    (map f lst) ;crea una lista con valore modificados 
    (foldl + 0 (map f lst)))) ;crea un acumulado con los valores de lalista modificados

  (printf "procesar lista: ~a\n" (procesar-lista '(1 2 3 4 5 6) halfamult))

;4 promedio positivos
(define filterpos 
  (lambda (lst) 
    (map (filter (lambda (x) (> x 0)) lst) foldl + 0))) 
      (printf "positiff ~a\n" (filterpos '(-1 -2 -3 4 5 6)))
  

(define (mayores-que lista n)
(filter (lambda (x) (> x n)) lista))
(printf "changos: ~a\n" (mayores-que '(1 2 3 4 5 6) 2))

(define (mayores-que2 lista n)
  (filter (lambda (x) (> x n)) lista))

(printf "changos: ~a\n" (mayores-que2 '(1 2 3 4 5 6) 2))

;5
