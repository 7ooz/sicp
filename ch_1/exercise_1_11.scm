#lang sicp

;;; Exercise 1.11

;; recursive process
(define (r-f n)
  (if (< n 3)
      n
      (+ (r-f (- n 1))
         (* 2 (r-f (- n 2)))
         (* 3 (r-f (- n 3))))))

;; 25
(r-f 5)

;; iterative process
(define (i-f n)
  (if (< n 3)
      n
      (iter 2 1 0 (- n 2))))

(define (iter a b c count)
  (if (= count 0)
      a
      (iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

;; 25
(i-f 5)