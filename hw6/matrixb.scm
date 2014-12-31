#lang racket
;helper function
;used to see how long a row is
(define (lengthof list)
  (define bla 0)
  (cond [(empty? list) 0]
        [else (+ 1 (lengthof (cdr list)))]))
;multiply row helper function
;this allows me to simply do matrix multiplication row by row
(define (multrow lista listb)
  (define veca (list->vector lista))
  (define vecb (list->vector listb))
  (define boundA (lengthof lista))
  (define boundB (lengthof listb))
  (define retvec(make-vector boundA))
  (cond[(> boundB boundA)(display "ERROR: lists of different size")]
    [else (begin
            (set! boundB (- boundB 1))
            (do ((i 0 (+ i 1)))
               ((> i boundB))
               (vector-set! retvec i (* (vector-ref veca i)(vector-ref vecb i))))
                (define retlist(vector->list retvec))
                (display retlist))]))

(define (mmul file1 file2 file3)
  ;definitions of local variables
  (define openfile1 (open-input-file file1))
  (define openfile2 (open-input-file file2))
  (define openfile3 (open-input-file file3)
  (define row1 (read-line openfile1))
  (define row2 (read-ling openfile2))
  (define process-row)
    ;convert these rows to lists
    ;   ran into problems here with extra chars in read
    ;run lists through multrow
    ;output to file3 
  ))