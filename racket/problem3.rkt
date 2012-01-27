;; Incomplete first-draft solution
#lang racket

(define small 13195)
(define max 600851475143)

(define primes (cons 2 '()))

(define unsieved 
  (rest (build-list (quotient small 2) 
                    (lambda (x) (+ (* x 2) 1)))))

(define (find-idx lst elm)
  (define (find-idx-with-accum lst elm i)
    (cond [(empty? lst) #f]
          [(= (first lst) elm) i]
          [else (find-idx-with-accum (rest lst) elm (+ i 1))]))
  (find-idx-with-accum lst elm 0))

(define (sieve prms lst)
  (let ([curr-prm-sqr (sqr (first lst))])
    (find-idx lst curr-prm-sqr)))