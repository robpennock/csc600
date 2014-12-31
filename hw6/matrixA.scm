#lang scheme

(define fileloc1 "/home/rob/matrix1.dat")
(define fileloc2 "/home/rob/matrix2.dat")
;Problem 6 a
;borrowing heavily from Dr Dujmovic's matrix handout
;this one is heavily commented to keep me losing track of variables
;incidently i love scheme but hate this () only syntax...
(define (row file rownum)
  ;definitions of local variables
  (define openfile (open-input-file file))
  ;total num of rows
  (define rowmax (read openfile))
  ;total num of cols
  (define colmax (read openfile))
  ;had to make this function internal to be able to use
  ;    local variables
  ;empty list at for storing entire row
  (define outrow '())
  
  (define (get-row row col)
    ;need to use if here 'cause multiple conds get confusing
    ;if (row == rownum) AND ( colmax > col)
    (begin (if [and (= row rownum) (> colmax col)] 
               ;append read of openfile to list outrow
               (set! outrow (cons (read openfile) outrow))
               ;read char
               (read openfile))
           ;else
           (cond 
             ;check row++ == rowmax
             [(= (+ 1 row) rowmax)
              ;and
              (if (> col colmax) 
                  (display "")
                  ;get next char from next col
                  (get-row row (+ 1 col)))]
             [(= (+ 1 col) colmax) 
              ;get-row on next row
              (get-row (+ 1 row) 0)]
             ;get-row on next column
             [else (get-row row (+ 1 col))])))
  (begin (set! rownum (- rownum 1))
  ;if specified row greater than rowmax
  (cond[ (< rowmax rownum)
      (begin (display "row #") 
             (display rownum) 
             (display " does not exist ") 
             (close-input-port openfile))]
      [else (begin 
             (get-row 0 0) 
             (close-input-port openfile) 
             ;since order will be revresed as these elements
             ;   were put into a list from top to bottom
             ;display reversed outrow
             (reverse outrow))])))
;end row

;begin column


(define (col file colnum)
  ;definitions of local variables
  (define openfile (open-input-file file))
  ;max num of rows in file
  (define rowmax (read openfile))
  ;max num of columns
  (define colmax (read openfile))
  ;empty list to be filled with chars by row
  (define column '())
  ;imbeded function so i have access to local vars
  (define (get-col row col)
    ;if (current col == colnum) then (read char from that column)
    (begin (if (= col colnum) 
               (set! column (cons (read openfile) column))
               (read openfile))
           ;else
           (cond 
             ;if (row++ == rowmax)
             [(= (+ 1 row) rowmax) 
              ;reached end of current row, call next row for next column car
              (if (< colmax col ) 
                  (display "") 
                  (get-col row (+ 1 col)))]
             [(= (+ 1 col) colmax)
              (get-col (+ 1 row) 0)]
             ;using row to get next line for get call to process
             [else (get-col row (+ 1 col))])))
  (begin (set! colnum (- 1 colnum))
  ;if specified col greater than colmax
  (if (> colnum colmax )
      ;isolted display and close
      (begin (display "col#") 
             (display colnum) 
             (display " Does not exist") 
             (close-input-port openfile))
      ;display and close
      (begin (get-col 0 0)
             (close-input-port openfile)
             ;since order will be revresed as these elements
             ;   were put into a list from top to bottom
             ;display reversed column
             (reverse column)))))
       