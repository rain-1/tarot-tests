(define (drain-queue q)
  (if (null? (queue:top q))
      #t ;(newline)
      (begin (display (queue-pop! q))
             (drain-queue q))))

(define qoooo (empty-queue))

(queue-push! qoooo 'h)
(queue-push! qoooo 'e)
(queue-push! qoooo 'l)
(queue-push! qoooo 'l)
(drain-queue qoooo)
(queue-push! qoooo 'l)
(queue-push! qoooo 'o)
(drain-queue qoooo)
(queue-push! qoooo 'w)
(queue-push! qoooo 'o)
(queue-push! qoooo 'r)
(drain-queue qoooo)
(drain-queue qoooo)
(drain-queue qoooo)
(queue-push! qoooo 'l)
(queue-push! qoooo 'd)
(drain-queue qoooo)
(newline)
