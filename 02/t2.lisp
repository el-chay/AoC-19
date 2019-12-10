;;; AoC 2019 day 2, task 1
(defun eat-char (stream char)
  (declare (ignore stream char))
  (values))
(set-macro-character #\, #'eat-char)

(defun intcode-calc (noun verb)
  (let ((prg-data (make-array 200 :fill-pointer 0)))
    (loop for n = (read t nil) while n do (vector-push n prg-data))
    (setf (elt prg-data 1) noun)
    (setf (elt prg-data 2) verb)
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
    (format t "~a~%" (elt prg-data 0))))

(defvar *argv-1* (second sb-ext:*posix-argv*))
(intcode-calc (parse-integer (subseq *argv-1* 0 2))
              (parse-integer (subseq *argv-1* 2)))
