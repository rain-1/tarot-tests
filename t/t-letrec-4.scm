(letrec ((countdown (lambda (i)
                      (if (= i 0) 'liftoff
                          (begin
                            (print i)
                            (newline)
                            (countdown (- i 1)))))))
  (print (countdown 10)))
