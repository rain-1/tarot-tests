
;(define print display)

(define (not x) (if x #f #t))

(define (even? x) (= 0 (modulo x 2)))
(define (odd? x) (not (even? x)))

;; Tail-recursive solution
(define (sieve n)
  (letrec (;(even? (lambda (x) (if (= x 0) #t (odd? (- x 1)))))
	   ;(odd? (lambda (x) (even? (- x 1))))
	   (aux (lambda (u v)
		  (let ((p (car v)))
		    (if (> (* p p) n)
			(let rev-append ((u u) (v v))
			  (if (null? u) v (rev-append (cdr u) (cons (car u) v))))
			(aux (cons p u)
			     (let wheel ((u '()) (v (cdr v)) (a (* p p)))
			       (if (null? v) (reverse u)
				   (if (= (car v) a) (wheel u (cdr v) (+ a p))
				       (if (> (car v) a) (wheel u v (+ a p))
					   (wheel (cons (car v) u) (cdr v) a)))))))))))
    (aux '(2)
	 (let range ((v '()) (k (if (odd? n) n (- n 1))))
	   (if (< k 3) v (range (cons k v) (- k 2)))))))
 
(for-each print (sieve 100))
					; (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)
(define (length l)
  (let loop ((lst l) (len 0))
    (if (null? lst)
	len
	(loop (cdr lst) (+ 1 len)))))

(print (length (sieve 10000)))
;(print (length (sieve 1000000)))

;(print (length (sieve 10000000)))
; 664579
