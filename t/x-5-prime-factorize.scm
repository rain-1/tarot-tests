(define (for-each proc l)
  (if (null? l)
      #t
      (begin (proc (car l))
	     (for-each proc (cdr l)))))

(define (factor^ divisor number)
    (if (> (* divisor divisor) number)
        (cons number '())
        (if (= (modulo number divisor) 0)
            (cons divisor (factor^ divisor (quotient number divisor)))
            (factor^ (+ divisor 1) number))))

(define (factor number)
  (factor^ 2 number))

(define (print-sp x) (print x) (print " "))

(define (print-list l)
  (for-each print-sp l)
  (newline))

(print-list (factor 111111111111))
(print-list (factor 1111111111111))
(print-list (factor 11111111111111))
(print-list (factor 111111111111111))
(print-list (factor 1111111111111111))
(print-list (factor 11111111111111111))
(print-list (factor 111111111111111111))
;; (print-list (factor 1111111111111111111)) ;; this ones prime, so takes a long time
;(print-list (factor 1111111111111111110)) ;; this is fast though
