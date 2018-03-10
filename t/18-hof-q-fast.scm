(define (for-loop start end proc)
 (let loop ((i start))
   (proc i)
   (unless (>= i end)
    (loop (+ i 1)))))

(define q-tbl (cons '() #f))

(define (q n)
 (cond ((assoc n (car q-tbl)) => cdr)
       (else (let ((res (q/memo n)))
               (set-car! q-tbl (cons (cons n res) (car q-tbl)))
               res))))

(define (q/memo n)
 (if (or (= 1 n) (= 2 n))
     1
     (+ (q (- n (q (- n 1))))
        (q (- n (q (- n 2)))))))

(for-loop 1 30 (lambda (i) (print `(q ,i = ,(q i)))))
