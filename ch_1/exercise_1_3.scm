#lang sicp

;;;; Exercise 1.3
;;; Define a procedure that takes three numbers as arguments
;;; and returns the sum of the squares of the two larger numbers.
;;; 注：此处中文版翻译有误，应是平方和而不是和

(define (sum-larger-squres x y z)
  (define (squre n)
    (* n n))
  (define (sum-squres a b)
    (+ (squre a)
       (squre b)))
  (cond ((and (>= x z) (>= y z)) (sum-squres x y))
        ((and (>= x y) (>= z y)) (sum-squres x z))
        ((and (>= y x) (>= z x)) (sum-squres y z))))

;;;;;;;;;;;;;;
(eq? (sum-larger-squres 5 4 3) 41)
(eq? (sum-larger-squres 1 1 3) 10)