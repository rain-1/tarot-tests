(define (partition!* v j high i pivot)
  (if (< j high)
      (let ((j* (vector-ref v j)))
        (if (<= j* pivot)
            (let ((i* (vector-ref v (unbox i))))
              (vector-set! v (unbox i) j*)
              (vector-set! v j i*)
              (set-box! i (+ (unbox i) 1)))
            #f)
        (partition!* v (+ j 1) high i pivot))
      #f))

(define (partition! v low high)
(print `(pivot ,(vector-length v) ,high))
  (let ((pivot (vector-ref v high))
        (i (box low)))
(print `(,pivot))
    (partition!* v low high i pivot)
    (let ((high* (vector-ref v high))
          (i* (vector-ref v (unbox i))))
      (vector-set! v (unbox i) high*)
      (vector-set! v high i*)
      (unbox i))))

(define (qsort!* v low high)
(print `(qsort!* v ,low ,high))
  (if (< low high)
      (let ((p (partition! v low high)))
        (print `(p ,p))
        (qsort!* v low (- p 1))
        (qsort!* v (+ p 1) high))
      v))

(define (qsort! v) (qsort!* v 0 (- (vector-length v) 1)))

(define v (vector 11 29 84 27 43  7 28 34
		  96 97 86 73 21 46 93 53
		  20 15 41 13  2 45 58))

(qsort! v)

(display v)
(newline)
