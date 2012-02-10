#lang racket

;; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
;; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

(define (smallest-div-by-list-nums lst num)
  (cond [(empty? lst) num]
        [else (let ([curr-factor (first lst)])
                (smallest-div-by-list-nums
                 (remove* '(1) (for/list ([i lst]) 
                                 (if (= (modulo i curr-factor) 0)
                                     (/ i curr-factor) i))) 
                 (* num curr-factor)))]))

(smallest-div-by-list-nums (rest (rest (build-list 11 values))) 1)
(smallest-div-by-list-nums (rest (rest (build-list 21 values))) 1)
