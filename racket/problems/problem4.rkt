#lang racket

;; Problem 4
;; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
;; Find the largest palindrome made from the product of two 3-digit numbers.


(define (num-digits num)
  (define (num-digits-rec num digits)
    (cond [(= num 0) digits]
          [else (num-digits-rec (quotient num 10) (+ digits 1))]))
  (num-digits-rec num 0))

;; pos counted from right
(define (get-digit num pos)
  (modulo (quotient num (expt 10 (- pos 1))) 10))         

;; Assumes number of digits in num and the correct answer are the same
(define (next-largest-palindrome num)
  (define (scroll num 0-to-9-idx-lst)
    (define (mult-and-add-to num pows)
      (cond [(empty? pows) num]
            [else (mult-and-add-to 
                   (+ num (* (expt 10 (- (first pows) 1)) 9)) (rest pows))])) 
    (let* ([next-first (+ (first 0-to-9-idx-lst) 1)]
           [next-last (- (last 0-to-9-idx-lst) 1)])
      (cond [(and (= (get-digit num next-first) 0) 
                  (= (get-digit num next-last) 0))
             (scroll num (append (append (list next-first) 0-to-9-idx-lst) 
                                 (list next-last)))]
            [else (mult-and-add-to 
                   (- (- num (expt 10 (- next-first 1))) 
                      (expt 10 (- next-last 1))) 0-to-9-idx-lst)])))
  (let* ([digits (num-digits num)]
         [mid (quotient (+ digits 1) 2)]
         [mid-digit (get-digit num mid)])
    (cond [(odd? digits) 
           (if (= mid-digit 0) (scroll num (list mid))
               (- num (expt 10 (- mid 1))))]
          [else
           (if (= mid-digit 0) (scroll num (list (+ mid 1) mid))
               (- (- num (expt 10 mid)) (expt 10 (- mid 1))))])))

(define (is-product-of-n-digit-nums n num)
  (let ([sqrt-num (sqrt num)])
    (define (is-product-of-n-digit-nums-rec n num fac)
      (cond [(< (num-digits fac) n) 
             (is-product-of-n-digit-nums-rec n num (+ fac 2))]
            [(> fac sqrt-num) #f]
            [(> (num-digits fac) n) #f]
            [(and (= (modulo num fac) 0) (= (num-digits (/ num fac)) n)) #t]
            [else (is-product-of-n-digit-nums-rec n num (+ fac 2))]))
    (cond [(even? num) (or (is-product-of-n-digit-nums-rec n num 2)
                           (is-product-of-n-digit-nums-rec n num 3))]
          [else (is-product-of-n-digit-nums-rec n num 3)])))
            
(define (largest-palindrome-product-of-n-digit-nums n)
  (define (largest-palindrome-product-of-n-digit-nums-rec num n)
    (cond [(let ([prime-factors (prime-factors num)])
             (is-product-of-n-digit-nums n num)) num]
          [else (largest-palindrome-product-of-n-digit-nums-rec
                 (next-largest-palindrome num) n)]))
  (largest-palindrome-product-of-n-digit-nums-rec (- (expt 10 (* n 2)) 1) n))


(largest-palindrome-product-of-n-digit-nums 2)
(largest-palindrome-product-of-n-digit-nums 3)