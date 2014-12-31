#lang racket

;Kenneth Robertson
;4-26-2014
;PROGRAMMING LANG DESIGN: Homework 6 scheme

;-Problem 1 a, annoynmous function
((lambda (in1 in2) (+ in1 in2)) 5 6)

;-Problem 1 b, example of a named function 
(define (Pythag a b)
  (sqrt (+(* a a) (* b b))))
;EXAMPLE
(Pythag 3 4)

;-Problem 1 c, data structure containing fundctions
(define oplist (list + - * /))
;EXAMPLE
((car oplist) 5 6)

;-Problem 1 d, comparing for equality
(equal? + +)
(equal? + (car oplist))
(equal? '(1 2 3 4) '(1 2 3 4))
(eq? '(1 2 3 4) '(1 2 3 4)) ;false because eq tests if objects are identical not just equal

;-Problem 1 e, passing function as input
(define (Accum func list identity)
  (if (null? list)
      identity
      (func (car list)
            (Accum func (cdr list) identity))))
;EXMAPLE:
(Accum + '(1 2 3 4 5) 0)

;-Problem 1 f, returning a function as output
(define (Arithmetic-lookup name)
  (cond ((equal? name "plus") +)
        ((equal? name "minus") -)
        ((equal? name "times") *)
        ((equal? name "divide") /)
        (else (write "Error invalid arithmetic name"))))
;Example
((Arithmetic-lookup "plus") 1 2)

;-Problem 1 g
;Reading function from keyboard
(define list-function (read))
(define input-function (eval list-function))

;Showing function
(begin (display list-function) (display " is ") (display input-function))

;Reading functions from file
(define port (open-input-file "C:/divisionFunctionFile.txt"))
(define file-list-function (read port))
(define file-function (eval file-list-function))
(file-function 6 3)
(close-input-port port)

;Problem 2
;Note: for some reason the versions that take variable arguments wont take lists
;so i created two different versions
(define (sum . vars) 
  (if (null? vars) 
      0 
      (+ (car vars) (apply sum (cdr vars))))) 

(define (sum-list list)
  (if (null? list) 
      0 
      (+ (car list) (sum-list (cdr list))))) 

(define (square-sum . vars) 
  (if (null? vars) 
      0 
      (+ (* (car vars) (car vars)) (apply square-sum (cdr vars))))) 

(define (square-sum-list list) 
  (if (null? list) 
      0 
      (+ (* (car list) (car list)) (square-sum-list (cdr list))))) 

(define (mean . list)
  (/ (sum-list list) (length list)))

(define (mean-list list)
  (/ (sum-list list) (length list)))

(define (mean-square . list)
  (/ (square-sum-list list) (length list)))

(define (mean-square-list list)
  (/ (square-sum-list list) (length list)))

(define (sigma . args)
  (let* ((mean (mean-list args))
         (mean-squared (* mean mean))
         (square-mean (mean-square-list args)))
    (sqrt (- square-mean mean-squared))))
         
;Examples
(sigma 1 2 3 2 1)
(sigma 1 3 1 3 1 3)
(sigma 1)

;Problem 3 a
(define (line number)
  (if (= number 0)
      (display "")
      (begin (display "*")
             (line (- number 1)))))
;Example
(line 5)

;Problem 3 b
(define (histogram list)
  (if (null? list)
      (display "")
      (begin (line (car list))
             (newline)
             (histogram (cdr list)))))

;Example
(histogram '(1 2 3 3 2 1))

;Problem 4
(define (find-max X1 X2 function)   
  (let* ((third (/ (- X2 X1) 3.))
         (Xnew1 (+ X1 third))
         (Xnew2 (- X2 third)))
    (cond ((> X1 X2) (display "ERROR: improperly defined x values"))
          ((< (abs (- (function X1) (function X2))) .0000001) (/ (+ X1 X2) 2.))
          ((< (function Xnew1) (function Xnew2)) (find-max Xnew1 X2 function))
          (else (find-max X1 Xnew2 function)))))
   
;Example
(find-max -1 1 (lambda (X) (+ (- (* X X)) X)))

;Problem 5
(define (scalar-product-recursive array1 array2)
  (define (scalar-product-helper index sum)
    (if (= (vector-length array1) index)
        sum
        (scalar-product-helper (+ index 1) (+ sum (* (vector-ref array1 index) (vector-ref array2 index))))))
  (if (= (vector-length array1) (vector-length array2))
      (scalar-product-helper 0 0)
      (display "ERROR: arrays must be of the same size to compute a scalar product")))

(define (scalar-product-iterative array1 array2)
  (let ((sum 0))
        (if (= (vector-length array1) (vector-length array2))
            (begin (do ((i 0 (+ 1 i)))
                     ((= i (vector-length array1)))
                     (set! sum (+ sum (* (vector-ref array1 i) (vector-ref array2 i)))))
                   sum)
            (display "ERROR: arrays must be of the same size to compute a scalar product"))))

;Example
(scalar-product-recursive '#(1 2 3) '#(2 1 1))
(scalar-product-recursive '#(1 2 3) '#(1 2 3 4 5))
(scalar-product-iterative '#(1 2 3) '#(2 1 1))
(scalar-product-iterative '#(1 2 3) '#(2 1 1 3))

;Problem 6 a
(define (row filepath rownumber)
  (define port (open-input-file filepath))
  (define row-output '())
  (define rows (read port))
  (define cols (read port))
  (define (getrow row col)
    (begin (if (and (= row rownumber) (< col cols)) (set! row-output (cons (read port) row-output)) (read port))
           (cond 
             ((= (+ row 1) rows) (if (> col cols) (display "") (getrow row (+ 1 col))))
             ((= (+ col 1) cols) (getrow (+ 1 row) 0))
             (else (getrow row (+ 1 col))))))
  (begin (set! rownumber (- rownumber 1))
  (if (> rownumber rows)
      (begin (display "row = ") (display rownumber) (display " does not exist in matrix ") (display filepath) (close-input-port port))
      (begin (getrow 0 0) (close-input-port port) (list->vector (reverse row-output))))))

(define (col filepath colnumber)
  (define port (open-input-file filepath))
  (define rows (read port))
  (define cols (read port))
  (define column '())
  (define (getcol row col)
    (begin (if (= col colnumber) (set! column (cons (read port) column)) (read port))
           (cond 
             ((= (+ row 1) rows) (if (> col cols) (display "") (getcol row (+ 1 col))))
             ((= (+ col 1) cols) (getcol (+ 1 row) 0))
             (else (getcol row (+ 1 col))))))
  (begin (set! colnumber (- colnumber 1))
  (if (> colnumber cols)
      (begin (display "col = ") (display colnumber) (display " does not exist in matrix ") (display filepath) (close-input-port port))
      (begin (getcol 0 0) (close-input-port port) (list->vector (reverse column))))))
       
;Outputs a string instead of a vector
(define (row-string filepath rownumber)
  (define port (open-input-file filepath))
  (define row-output '())
  (define rows (read port))
  (define cols (read port))
  (define (getrow index)
    (if (= rownumber index)
        (begin (set! row-output (read-line port)) row-output)
        (begin (read-line port) (getrow (+ index 1)))))
  (if (> rownumber rows)
      (begin (display "row = ") (display rownumber) (display " does not exist in matrix ") (display filepath) (close-input-port port))
      (begin (getrow 0) (close-input-port port) row-output)))

;EXAMPLES
(row "c:/matrix1.dat" 1)
(col "c:/matrix1.dat" 2)

;Problem 6 b      
(define (matrix-row-number matrixfile) ;Helper function to get number of rows
  (define port (open-input-file matrixfile))
  (define row-number (read port))
  (begin (close-input-port port) row-number)j)
  
(define (matrix-col-number matrixfile) ;Helper function to get number of cols
  (define port (open-input-file matrixfile))
  (define col-number '())
  (begin (read port) (set! col-number (read port)) col-number))
  
(define (mmul inmatfile1 inmatfile2 outmatfile)
  (define port (open-output-file outmatfile #:exists 'replace))
  (begin 
    (display (vector-length (col inmatfile1 1)) port) (display " " port)
    (display (vector-length (row inmatfile2 1)) port) (display "\r\n" port)
    (do ((r 1 (+ 1 r)))
      ((> r (matrix-row-number inmatfile1)))
      (begin 
        (do ((c 1 (+ 1 c)))
          ((> c (matrix-col-number inmatfile2)))
          (begin (display (scalar-product-recursive (row inmatfile1 r) (col inmatfile2 c))) (display " ")
                 (display (scalar-product-recursive (row inmatfile1 r) (col inmatfile2 c)) port) (display " " port))
          (display "")))
      (newline) (display "\r\n" port))
    (close-output-port port)))

;EXAMPLE
(mmul "c:/matrix1.dat" "c:/matrix2.dat" "c:/matrix3.dat")
  
  
  
                        
    