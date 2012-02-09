#lang racket

;; Incomplete first-draft solution

;; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
;; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

(define (smallest-div-by-list-nums lst num)
  (cond ([(empty? lst) num]
         [else 
(rest (rest (build-list 21 values)))
