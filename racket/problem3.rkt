;; First-draft solution
#lang racket

(define small 13195)
(define max 600851475143)
(define primes (cons 2 '()))
(define unsieved 
  (rest (build-list (quotient small 2) 
                    (lambda (x) (+ (* x 2) 1)))))




