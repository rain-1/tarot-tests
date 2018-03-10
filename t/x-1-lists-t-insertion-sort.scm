;; import lists/insertion-sort.scm

(include "tarot-tests/supporting/insertion-sort.scm")

(define list
  '(9 5 3 7 0 8 6 5 1 4 2))

(print (sort-by < list))
