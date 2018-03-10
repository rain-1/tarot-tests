(define fact
  (lambda (n)
    (letrec ((inner
              (lambda (n acc)
                (if (= n 1)
                    acc
                    (inner (- n 1) (* acc n))))))
      (inner n 1))))

(print (fact 7))
(newline)
