(define (kons kar kdr) (lambda (sel) (sel kar kdr)))
(define (kar kons) (kons (lambda (x y) x)))
(define (kdr kons) (kons (lambda (x y) y)))

(define (list->klist l)
 (if (null? l)
     '()
     (kons (car l) (list->klist (cdr l)))))

(define (klist->list k)
 (if (null? k)
     '()
     (cons (kar k) (klist->list (kdr k)))))

(define l '(4 9 3 8 4 1 9 3 8))
(for-each print
 (klist->list
  (list->klist
   (klist->list
    (list->klist
     (klist->list
      (list->klist l)))))))
