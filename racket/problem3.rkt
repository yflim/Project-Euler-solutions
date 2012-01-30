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

(define (sieve lst prms)
  (let* ([curr-prm-sqr (sqr (first lst))]
         [curr-prm-sqr-idx (find-idx lst curr-prm-sqr)]
         [lst->prms (take lst curr-prm-sqr-idx)]
         [remaining-lst (drop lst curr-prm-sqr-idx)]
         [not-divisible (lambda (x) (andmap 
                                     (lambda (y) (not (= (modulo x y) 0))) 
                                     lst->prms))]
         [new-lst (filter not-divisible remaining-lst)]
         [new-prms (append prms lst->prms)])
    (sieve new-prms new-lst)))

(sieve unsieved primes)
         