#lang sicp

;;; Exercise 1.10

;; Ackermann’s function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; 2 ^ 10  = 1024
(A 1 10)

;; 2 ^ (2 ^ (2 ^ 2) = 65536
(A 2 4)

;; 2 ^ (2 ^ (2 ^ 2) = 65536
(A 3 3)

;; f: n -> 2 n
(define (f n) (A 0 n))

;; g: n -> 2 ^ n
(define (g n) (A 1 n))

;; h: n -> 2 ^ (2 ^ (2 ^ ... 2 ^ 2)  「连续求 n - 1 次二次幂」
(define (h n) (A 2 n))
