;(define (b-or x y) (if x #t y))
;(define (b-and x y) (if x y #f))
(define (zero? x) (= x 0))

(define (in-carpet? x y)
  (if (or (zero? x) (zero? y))
       #t
       (if (and (= 1 (modulo x 3)) (= 1 (modulo y 3)))
            #f
            (in-carpet? (quotient x 3) (quotient y 3)))))
 
(define (carpet n)
  (let loop-1 ((i 0))
     (let loop-2 ((j 0))
        (display (if (in-carpet? i j)
                     "*"
                     " "))
     (if (< j (* (* n n) n)) (loop-2 (+ j 1)) #t))
   (newline)
   (if (< i (* (* n n) n)) (loop-1 (+ i 1)) #t)))

(carpet 3)
