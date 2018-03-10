;; import lists/fold.scm lists/list-sets.scm

;(include "tests/supporting/fold.scm")
(include "tarot-tests/supporting/list-sets.scm")
(include "tarot-tests/supporting/member.scm")

;; http://okmij.org/ftp/kakuritu/logic-programming.html#StrangeLoop
;;
;; "U2" has a concert that starts in 17 minutes and they must all
;; cross a bridge to get there. They stand on the same side of the
;; bridge. It is night. There is one flashlight. A maximum of two
;; people can cross at one time, and they must have the flashlight
;; with them. The flashlight must be walked back and forth. A
;; pair walk together at the rate of the slower mans pace:
;;
;; Bono 1 minute to cross
;; Edge 2 minutes to cross
;; Adam 5 minutes to cross
;; Larry 10 minutes to cross
;;
;; For example: if Bono and Larry walk across first, 10 minutes have
;; elapsed when they get to the other side of the bridge. If Larry then
;; returns with the flashlight, a total of 20 minutes have passed and you
;; have failed the mission.

(define (bind xs)
  (lambda (f)
    (let loop ((xs xs) (m '()))
      (if (null? xs)
          m
          (loop (cdr xs) (append (f (car xs)) m))))))

(define (fail) '())

(define (success x) (list x))

(define t1
  (let cross-bridge ((side-from '(1 2 5 10))
                     (side-to '())
                     (forwardp #t)
                     (elapsed-time 0)
                     (trace '()))
    (cond ((> elapsed-time 17) (fail))
          ((and (not forwardp) (null? side-to)) (success (reverse trace)))
          (else
           ((bind side-from)
            (lambda (p1)
              ((bind (filter (lambda (p2) (>= p1 p2)) side-from))
               (lambda (p2)
                 ((bind (list (if (equal? p1 p2) (list p1) (list p1 p2))))
                  (lambda (party)
                    (cross-bridge
                     (set-union party side-to)
                     (set-difference side-from party)
                     (not forwardp)
                     (+ elapsed-time (fold max 0 party)) 
                     (cons party trace))))))))))))

(display t1) (newline)
