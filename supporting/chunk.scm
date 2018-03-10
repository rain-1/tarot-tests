(define (throw-a-chunk-into span l thunk)
  (let loop ((span span) (chunk '()) (l l))
    (if (null? l)
	(thunk (reverse chunk) #f)
	(if (= 0 span)
	    (thunk (reverse chunk) l)
	    (loop (- span 1) (cons (car l) chunk) (cdr l))))))

(define (chunks span l)
  (throw-a-chunk-into span l
		      (lambda (chunk rest)
			(if rest
			    (cons chunk (chunks span rest))
			    (cons chunk '())))))
