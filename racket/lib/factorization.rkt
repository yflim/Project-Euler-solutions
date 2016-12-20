#lang racket

(provide (all-defined-out))

;; for correctness, need to first call with complement <= smallest factor
(define (largest-factor-gteq odd complement)
  (cond [(> complement (sqrt odd)) odd]
        [(= (modulo odd complement) 0) (/ odd complement)]
        [else (largest-factor-gteq odd (+ complement 2))]))

(define (largest-odd-factor even)
  (cond [(even? even) (largest-odd-factor (/ even 2))]
        [else even]))

(define (to-list power-of-two lst)
  (cond [(= power-of-two 1) lst]
        [else (to-list (/ power-of-two 2) (append lst (list 2)))]))

(define (prime-factors num)
  (define (prime-factors-rec num lst)
    (let* ([bigfac (largest-factor-gteq num (last lst))]
           [bigfac-complement (/ num bigfac)])
      (cond [(not (= bigfac num))
             (prime-factors-rec bigfac (append lst (list bigfac-complement)))]
            [else (append lst (list num))])))
  (cond [(even? num) (let ([odd (largest-odd-factor num)])
                       (prime-factors-rec odd (to-list (/ num odd) '())))]
        [else (let ([fac (largest-factor-gteq num 3)])
                (prime-factors-rec fac (list (/ num fac))))]))

(define (largest-prime-factor-gteq num min-complement)
  (let* ([bigfac (largest-factor-gteq num min-complement)]
         [bigfac-complement (/ num bigfac)])
    (cond [(not (= bigfac num))
           (largest-prime-factor-gteq bigfac bigfac-complement)]
          [else num])))
