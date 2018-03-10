(define l '(1 2 3 4 5))
(define (sum n) (if (null? n) 0 (+ (car n) (sum (cdr n)))))
(print (sum l))
(newline)
