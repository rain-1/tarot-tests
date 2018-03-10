(define (for-loop start end proc)
 (let loop ((i start))
   (proc i)
   (unless (>= i end)
    (loop (+ i 1)))))

(for-loop 1 100 (lambda (i) (print `(q ,i = ,(+ i 1)))))
