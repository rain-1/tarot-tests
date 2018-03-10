(define (zero? x) (= x 0))

(letrec ((sum (lambda (x)
             (if (zero? x)
                 0
                 (+ x (sum (- x 1)))))))
   (print (sum 5)))
