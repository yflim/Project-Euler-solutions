#lang racket

(require "../lib/factoring.rkt")

;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143?


(define (largest-prime-factor num)
  (let* ([sqrt-num (sqrt num)])
    (define (largest-factor-gteq odd fac)
      (cond [(> fac (sqrt odd)) odd]
            [(= (modulo odd fac) 0) (/ odd fac)]
            [else (largest-factor-gteq odd (+ fac 2))]))
    (define (largest-prime-factor-gteq num minfac)
      (let* ([bigfac (largest-factor-gteq num minfac)]
             [bigfac-complement (/ num bigfac)])
        (cond [(not (= bigfac num))
               (largest-prime-factor-gteq bigfac bigfac-complement)]
              [else num])))
    (cond [(even? num) 
           (let ([odd (largest-odd-factor num)])
             (cond [(> odd 1) (largest-prime-factor-gteq odd 3)]
                   [else 2]))]
          [else (largest-prime-factor-gteq num 3)])))

(define big 600851475143)
(time (largest-prime-factor big))

         
