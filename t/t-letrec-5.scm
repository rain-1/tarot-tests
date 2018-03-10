(define (lazy-fib-list)
  (letrec ((next-number (lambda (n m)
                        (cons n (lambda () (next-number m (+ n m)))))))
    (next-number 0 1)))

(define lazy-head car)
(define (lazy-tail lazy-list) ((cdr lazy-list)))

(define (nth n lazy-list)
  (if (<= n 0) (lazy-head lazy-list)
               (nth (- n 1) (lazy-tail lazy-list))))

(print (nth 0 (lazy-fib-list)))
(print (nth 1 (lazy-fib-list)))
(print (nth 2 (lazy-fib-list)))
(print (nth 3 (lazy-fib-list)))
(print (nth 4 (lazy-fib-list)))
(print (nth 5 (lazy-fib-list)))
(print (nth 6 (lazy-fib-list)))
(print (nth 7 (lazy-fib-list)))
(print (nth 8 (lazy-fib-list)))
(print (nth 9 (lazy-fib-list)))
