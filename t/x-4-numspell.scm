(define oneto19     '(one two three four five six seven eight nine ten eleven twelve
			thirteen fourteen fifteen sixteen seventeen eighteen nineteen))
(define multof10  '(twenty thirty forty fifty sixty seventy eighty ninety))
(define thousands '(thousand million billion trillion quadrillion quintillion sextillion septillion octillion nonillion decillion undecillion))

(define (list-ref l i)
 (if (= i 0) (car l) (list-ref (cdr l) (- i 1))))

(define (n2t n)
  (cond
    ((= n 0) '(zero))  ; zero is a special case since from now on all 0 will be suppressed
    ((< n 0) (cons 'minus (n2t (- 0 n))))
    (else
     (let loop ((n n) (units thousands) (res '()))
       (cond
         ; --- below 1000
         ((= n 0)    res)
         ((and (< 0 n) (< n 20)) (cons (list-ref oneto19    (- n 1)) res))
         ((< n 100)  (cons (list-ref multof10 (- (quotient n 10) 2))
                           (loop (remainder n 10) '() res)))
         ((< n 1000) (loop (quotient n 100)
                           '()
                           (cons 'hundred (loop (remainder n 100) '() res))))
         (else
          ; --- 1000 and above
          (let ((q   (quotient n 1000))
                (res (loop (remainder n 1000) thousands res)))
            (if (zero? q)
                res
                (loop q (cdr units) (cons (car units) res))))))))))

(print (n2t 0))
;'(zero)
(print (n2t 1001))
;'(one thousand one)
(print (n2t 132219))
;'(one hundred thirty two thousand two hundred nineteen)
(print (n2t -132219))
;'(minus one hundred thirty two thousand two hundred nineteen)
(print (n2t 2345678213))
;'(two billion three hundred forty five million six hundred seventy eight thousand two hundred thirteen)
(print (n2t 2432902008176640000))
;'(two quintillion four hundred thirty two quadrillion nine hundred two trillion eight billion one hundred seventy six million six hundred forty thousand)

