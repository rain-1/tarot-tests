(define (for-loop start end proc)
 (let loop ((i start))
   (proc i)
   (unless (>= i end)
    (loop (+ i 1)))))

(define (q n)
 (if (or (= 1 n) (= 2 n))
     1
     (+ (q (- n (q (- n 1))))
        (q (- n (q (- n 2)))))))

(for-loop 1 23 (lambda (i) (print `(q ,i = ,(q i)))))
