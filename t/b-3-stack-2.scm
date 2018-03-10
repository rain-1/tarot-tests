(define s (empty-stack))

(define t
'((a
  .
  (b . c))
 .
 ((e . (f . g))
 .
 h)))

(define (dfs tree stk)
  (if (pair? tree)
      (begin (dfs (car tree) stk)
             (dfs (cdr tree) stk))
      (stack-push! stk tree)))

(dfs t s)
(print (stack-get s))
