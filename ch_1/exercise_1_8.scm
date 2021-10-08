#lang sicp

;;;; Exercise 1.8
;;; Newton's method for cube roots

(define (squre x)
  (* x x))

(define (cube x)
  (* (squre x) x))

(define (good-enough? guess new-guess)
  (< (/ (abs (- guess new-guess)) guess)
     0.01))

(define (improve y x)
  (/ (+ (/ x (squre y)) (* 2 y))
     3))

(define (cbrt-iter guess x)
    (if (good-enough? guess (improve guess x))
        guess
        (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 2 x))

;; 2
(cbrt 8)
