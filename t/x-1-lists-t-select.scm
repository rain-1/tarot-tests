;; import lists/standard.scm

(include "tarot-tests/supporting/member.scm")
(include "tarot-tests/supporting/standard.scm")

(print (select '(a b c d) '()
	       (lambda (x y)
		 (display `(,x ,y))
		 (newline)
		 (cons y (cons y '())))))
