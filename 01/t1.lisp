;;;; AoC 2019 day 1, task 1
(format t "~a~%"
 (loop for x = (read t nil)
       while x
       sum (- (floor (/ x 3)) 2)))
