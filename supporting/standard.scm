(define (every p? l)
  (if (null? l)
      #t
      (if (p? (car l)) (every p? (cdr l))
	  #f)))

(define (select l acc thunk)
  (if (null? l)
      '()
      (append (thunk (car l) (append (reverse acc) (cdr l)))
	      (select (cdr l) (cons (car l) acc) thunk))))

(define (list-union s1 s2)
  (cond ((null? s1) s2)
        ((member (car s1) s2) (list-union (cdr s1) s2))
        (else (cons (car s1) (list-union (cdr s1) s2)))))

(define (list-difference s1 s2)
  (cond ((null? s1) '())
        ((member (car s1) s2) (list-difference (cdr s1) s2))
        (else (cons (car s1)
                    (list-difference (cdr s1) s2)))))

(define (map* f l)
  (if (null? l)
      '()
      (let* ((h (f (car l))) (t (map* f (cdr l)))) (cons h t))))

(define (concat-map f l)
  (if (null? l)
      '()
      (append (f (car l))
	      (concat-map f (cdr l)))))
