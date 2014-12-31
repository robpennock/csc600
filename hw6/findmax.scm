#lang racket

;Problem 4
(define (find-max X Y funct)  
  ;got multiply (x-y) by 1/3 from 
  ;   http://www41.homepage.villanova.edu/robert.styer/trisecting%20segment/
  ;and 
  ;   http://www.algebra.com/algebra/homework/Length-and-distance/Length-and-distance.faq.question.345492.html
  ;cant use define here since these are not identifiers
  ;just using general function instead of linear equation
  ;must use let*
  (let* ((trisect (/ (- Y X) 3.))
         (xtri (+ X trisect))
         (ytri (- Y trisect)))
    ;meat of the work
    (cond [(> X Y) 
           (display "ERROR: first value must be larger than second")]
          ;using abs library function
          ;if absolute value of functX - functY then divide (X + Y)/2
          ;basically keep running until reaching precision of 0.0000001
          [(< (abs (- (funct X) (funct Y))) .0000001)
           ;bisection
           (/ (+ Y X) 2.)]
          ;elseif (funct xtri < funct ytri) then findmax of X and ytri
          ;
          ;basically run again with a trisected Y value
          ;recursive call
          [(> (funct xtri) (funct ytri)) 
           (find-max X ytri funct)]
          ;Y must be bigger than xtri
          ;keep Y and run again with trisected x value
          [else (find-max xtri Y funct)])))
