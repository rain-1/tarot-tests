(define (member elt list)
  (if (null? list)
      #f
      (if (equal? elt (car list))
          #t
          (member elt (cdr list)))))
