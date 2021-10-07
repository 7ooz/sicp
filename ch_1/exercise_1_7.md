### Exercise 1.7
书中使用牛顿法求平方根时，所用的 good-enough 方法在遇到极大或极小的数字时会出现较大误差  

```scheme
#lang sicp

;;;; Exercise 1.7
;;; good-enough will not work for a large or small number
;;; rewrite good-enough

(define (squre x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (squre guess) x)) 0.01)

(define (average a b)
  (/ (+ a b) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define sqrt-iter
  (lambda(guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x))))

(define (sqrt x)
  (sqrt-iter 1 x))
```
例如，当求 0.00003 的平方根时，因为 good-enough 中的误差精度只有 0.01，还不够小，所以最后的结果有较大误差；  
而当求 99999999999999999999999999.0 的平方根时，因为浮点数的精度有限，当数字太大、位数太多时，小数点后的位数精度会有损失，因此无法计算两个大数的差，从而陷入死循环

```scheme
;; 解释器结果 0.03128196223027221
;; 正确结果是 0.00173
(sqrt 0.000003)

;; 死循环
(sqrt 99999999999999999999999999.0)
```  
#### 改进后的good-enough  
通过比较新 guess 和旧 guess 的变化比例来评估误差，此时便能够得出正确结果
```scheme
(define (new-good-enough? guess new-guess)
  (< (/ (abs (- new-guess guess)) guess) 0.01))

(define sqrt-iter
  (lambda(guess x)
    (if (new-good-enough? guess (improve guess x))
        guess
        (sqrt-iter (improve guess x) x))))

;; 0.001732053192070565
(sqrt 0.000003)

;; 10000015448235.172
(sqrt 99999999999999999999999999.0)
