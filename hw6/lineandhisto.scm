#lang scheme

(define (line n)
  (cond [(<= n 0) (newline)]
        [else (begin
              (display `*)
              (line(- n 1)))]))
(define (histogram list)
  (cond [(null? list) (display "")]
        [else (line(car list)) (histogram(cdr list))]))