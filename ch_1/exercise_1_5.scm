#lang sicp

;;;; Exercise 1.5


(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;;; answer:
;;;  if the interpreter uses application-order evaluation, then the program will never stop.
;;;  else if it uses normal-order evaluation, (test 0 (p)) will return 0.
;;;  the reason is that
;;;  for application-order evaluation, it will evaluate the arguments and then apply,
;;;  while for normal-order evaluation, it will fully expand and then reduce.