(define (fold kons knil l)
 (if (null? l) knil (kons (car l) (fold kons knil (cdr l)))))

(define (iota n)
  (let iota-aux ((i 0))
    (if (> i n)
        '()
        (cons i (iota-aux (+ i 1))))))

;(define (b-or x y) (if x #t y))

(print
 (fold (lambda (x tot)
 	(+ tot (if (or (zero? (remainder x 3)) (zero? (remainder x 5))) x 0)))
       0
       (iota 1000)))
