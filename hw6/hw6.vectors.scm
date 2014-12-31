#lang scheme

;(scalar-product vec1 vec2)
(define vec1 `#(1 2 3))
(define vec2 `#(1 2 3))
(define vec3 `#())
;itterative scalar-product
;heavily borrowed from Dr Dujmovic's code
;except for the second line since DrRacket hates the '<>' operator
(define (scalar-product v1 v2)
  (cond [(not(equal? (vector-length v1) (vector-length v2)))
         (display "error: vectors not same length")]
        [(zero? (vector-length v1))(display "error: null vector")]       
        [else (let((s 0))
                (do ((i 0 (add1 i)))
                    ((>= i (vector-length v1)) (display s))
                  (set! s 
                        (+ s (* (vector-ref v1 i) (vector-ref v2 i))))))]))
;very similar to Dr Dujmovic's splist dot-product code
(define (uselist list1 list2)
  (cond[(null? (cdr list1)) (* (car list1) (car list2))]
       [else (+ (* (car list1) (car list2))(uselist (cdr list1) (cdr list2))
                )]))
;same as scalar-product except the else statement converts the vectors
;   to lists for easier processing
(define (scalar-product-recursive v1 v2)
  (cond [(not(equal? (vector-length v1) (vector-length v2)))
         (display "error: vectors not same length")]
        [(zero? (vector-length v1))(display "error: null vector")]        
        [else (uselist (vector->list v1) (vector->list v2))]))