(define (fact n a)
  (if (eq? n 0)
      a
      (fact (- n 1) (* n a))))
(print (fact 5 1))
