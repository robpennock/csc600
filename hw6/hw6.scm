#lang scheme
(define bla `(1,2,3,4,5))
(define (count-list list)
  (cond [(empty? list) 0]
      [else ( + 1 (count-list(cdr list)))]))
    
;demo do loop
(define (do-demo blarg)
  (do ((i 0 (+ 1 i)))   ;initialization of i and increment
    (( > i blarg))      ; test terminator: i > blarg
    (display i)         ; display i while test cond not true
    (display " ")))     ;print space after printing i
    
(define (line i)
  (cond [(<= i 0) (display "\n")]
        [else (begin (display "*")
                    (line (- i 1)))]))
(define (line-it n)
  (do ((i 0 (+ 1 i)))
       ((>= i n))
       (display "*"))
  (display "\n"))
    
(define (hist list)
  (cond ((null? list) (display ""))
      (else (begin (line (car list))
                   (hist (cdr list))))))
(define (hist-it list)
  (cond[(= (length list) 0) (display "\n")]
       [else (do((i 0)(+ 1 i))
               ((> i (length list)))
               (line (car list))
               (set! list (cdr list)))]))
    
    
    