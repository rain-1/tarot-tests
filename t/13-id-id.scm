(define (id x) x)

(let ((id^ id)
      (print^ (id (id print))))
  (print^ (id^ 5)))
