;;;; AoC 2019 day 1, task 2
(format t "~a~%"
 (loop
   for x = (read t nil)
   while x
   sum (labels
           ((fuel-calc (mass &optional (total 0) (fuel (- (floor (/ mass 3)) 2)))
              (if (> fuel 0)
                  (fuel-calc fuel (+ total fuel))
                  total)))
         (fuel-calc x))))
