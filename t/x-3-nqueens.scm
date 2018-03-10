(define (enumerate-interval a b)
 (cons a (if (= a b) '() (enumerate-interval (+ a 1) b))))

(define (abs n) (if (< n 0) (- 0 n) n))

(define (list-ref l i)
 (if (= i 0) (car l) (list-ref (cdr l) (- i 1))))

(define flatmap concat-map)
(define (queens board-size)
   (letrec ((queen-cols (lambda (k)
     (if (= k 0)
         (list empty-board)
         (filter
          (lambda (positions) (safe? k positions))
          (flatmap
           (lambda (rest-of-queens)
             (map (lambda (new-row)
                    (adjoin-position new-row k rest-of-queens))
                  (enumerate-interval 1 board-size)))
           (queen-cols (- k 1))))))))
   (queen-cols board-size)))

(define (make-position row col)
   (cons row col))

(define (position-row position)
   (car position))

(define (position-col position)
   (cdr position))

(define empty-board '())

(define (adjoin-position row col positions)
   (append positions (list (make-position row col))))

(define (safe? col positions)
   (let ((kth-queen (list-ref positions (- col 1)))
         (other-queens (filter (lambda (q)
                                 (not (= col (position-col q))))
                               positions))
         (attacks? (lambda (q1 q2)
     (or (= (position-row q1) (position-row q2))
         (= (abs (- (position-row q1) (position-row q2)))
            (abs (- (position-col q1) (position-col q2))))))))

   (letrec ((iter (lambda (q board)
     (or (null? board)
         (and (not (attacks? q (car board)))
              (iter q (cdr board)))))))
   (iter kth-queen other-queens))))

(print (queens 4))
(print (length (queens 7))) ;; 40
(print (queens 8))
