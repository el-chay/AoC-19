;;; AoC 2019 day 2, task 1
(defun eat-char (stream char)
  (declare (ignore stream char))
  (values))
(set-macro-character #\, #'eat-char)

(let ((prg-data (make-array 200 :fill-pointer 0)))
  (loop for n = (read t nil) while n do (vector-push n prg-data))
  (setf (elt prg-data 1) 12)
  (setf (elt prg-data 2) 2)
  (format t "~a~%" prg-data)
  (loop
    for i below (length prg-data) by 4
    for op = (elt prg-data i)
    while (/= op 99)
    for v1 = (elt prg-data (elt prg-data (+ i 1)))
    and v2 = (elt prg-data (elt prg-data (+ i 2)))
    do (setf (elt prg-data (elt prg-data (+ i 3)))
             (funcall
              (cond ((= op 1) '+) ((= op 2) '*))
              v1 v2)))
  (format t "~a~%" prg-data))
;; 3931283
