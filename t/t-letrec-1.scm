(define (not x) (if x #f #t))

(letrec ((even? (lambda (x) (if (= x 0) #t (odd? (- x 1)))))
         (odd? (lambda (x) (not (even? x)))))
 (print (even? 7))
 (print (odd? 7))
 (print (even? 8))
 (print (odd? 8))
 (print (even? 9)))


