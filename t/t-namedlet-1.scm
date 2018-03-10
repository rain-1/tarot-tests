(let countdown ((i 20))
   (if (= i 0) (print 'liftoff)
        (begin
         (print i)
         (newline)
         (countdown (- i 1)))))

