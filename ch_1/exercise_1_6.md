### Exercise 1.6

if 语句是一种特殊形式，当它的 predicate 为真时， then-clause 分支会被求值，  
否则， else-clause 分支被求值，两个 clause 只有一个会被求值


``` scheme
(define sqrt-iter
  (lambda(guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x))))
```


而Alyssa定义的new-if是普通的函数形式，  
根据解释器的 **application-order evaluation** 模型，会对传入new-if的每一个参数都先求值  
因此sqrt-iter作为new-if的第三个参数，在求值时产生的递归调用永远不会中止，造成解释器的栈溢出
