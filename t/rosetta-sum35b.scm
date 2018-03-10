(define (trisum n fac)
    (let ((n1 (quotient (- n 1) fac)) 
          (n2 (+ n1 1)))
        (quotient (* fac (* n1 n2)) 2)))
 
(define (fast35sum n)
    (- (+ (trisum n 5) (trisum n 3)) (trisum n 15)))
 
(print (fast35sum 1000))
(print (fast35sum 1000000))
