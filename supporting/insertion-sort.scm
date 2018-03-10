(define (comparing < f)
  (lambda (x y)
    (< (f x) (f y))))

(define (insert-by < elt rest)
  (if (null? rest)
      (cons elt '())
      (if (< elt (car rest))
          (cons elt rest)
          (cons (car rest) (insert-by < elt (cdr rest))))))

(define (sort-by < list)
  (if (null? list)
      list
      (insert-by < (car list) (sort-by < (cdr list)))))
