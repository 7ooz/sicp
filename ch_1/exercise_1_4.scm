#lang sicp

;;;; Exercise 1.4
;; 求 a + |b|
;; 若 b > 0, 则 a + b
;; 若 b <= 0, 则 a - b


(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;;;;;;;;;;;;;;;;;
(eq? (a-plus-abs-b 5 3) 8)
(eq? (a-plus-abs-b 16 -2) 18)