(define s (empty-stack))

(stack-push! s 'a)
(stack-push! s 'b)
(stack-push! s 'c)
(stack-push! s 'd)
(stack-push! s 'e)
(print (stack-pop! s))
(print (stack-pop! s))
(print (stack-pop! s))
(stack-push! s 'x)
(stack-push! s 'y)
(stack-push! s 'z)
(print (stack-pop! s))
(print (stack-pop! s))
(print (stack-pop! s))
(print (stack-pop! s))
(print (stack-pop! s))
