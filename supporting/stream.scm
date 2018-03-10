(define (stream:car s)
  (cond ((pair? s) (car s))
	((procedure? s) (stream:car (s)))
	(else (error 'stream:car "?" s))))

(define (stream:cdr s)
  (cond ((pair? s) (cdr s))
	((procedure? s) (stream:cdr (s)))
	(else (error 'stream:car "?" s))))

(define (stream:append s1 s2)
  (cond ((null? s1) s2)
	((pair? s1) (cons (car s1) (stream:append (cdr s1) s2)))
	((procedure? s1) (lambda () (stream:append (s1) s2)))
	(else (error 'stream:append "?" s1))))

(define (stream:flat-map f s1 s2)
  (stream:append (f (stream:car s1) (stream:car s2))
		 (lambda () (stream:flat-map f (stream:cdr s1) (stream:cdr s2)))))

(define (stream:cycle l)
  (letrec ((res (lambda () (stream:append l (lambda () res)))))
    (res)))
