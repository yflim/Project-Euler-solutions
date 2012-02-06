;; Incomplete first-draft solution
#lang racket

(define (largest-prime-factor num)
  (let* ([sqrt-num (sqrt num)])
    (define (largest-factor-gteq odd fac)
      (cond [(> fac (sqrt odd)) odd]
            [(> fac sqrt-num) odd]
            [(= (modulo odd fac) 0) (/ odd fac)]
            [else (largest-factor-gteq odd (+ fac 2))]))
    (define (largest-prime-factor-gteq num minfac lst)
      (let* ([bigfac (largest-factor-gteq num minfac)]
             [bigfac-complement (/ num bigfac)])
        (cond [(not (= bigfac num))
               (largest-prime-factor-gteq bigfac bigfac-complement (append lst (cons bigfac-complement '())))]
              [else num])))
    (largest-prime-factor-gteq num 3 '())))

(define big 600851475143)
(time (largest-prime-factor big))

         