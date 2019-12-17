;;; AoC 2019 day 3, task 1
;;
;;      U (y axis)
;;      ^
;;      |
;; L <- o -> R (x axis)
;;      |
;;      v
;;      D
;;

(defparameter *x-axis* (make-array 350 :fill-pointer 0))
(defparameter *y-axis* (make-array 350 :fill-pointer 0))
(defparameter *cur-pos* '(0 0))
(defparameter *cable-route-data* nil)

;; ignore comma
(set-macro-character #\, (lambda (s c) (declare (ignore s c)) (values)))

;; Cable information is one per line
(set-macro-character
 #\linefeed
 (lambda (s c)
   (declare (ignore s c))
   (setf *cable-route-data* (acons 'a (list *x-axis* *y-axis*) *cable-route-data*))
   (setf *x-axis* (make-array 350 :fill-pointer 0))
   (setf *y-axis* (make-array 350 :fill-pointer 0))
   (set-macro-character
    #\linefeed
    (lambda (s c)
      (declare (ignore s c))
      (setf *cable-route-data*
            (acons 'b (list *x-axis* *y-axis*) *cable-route-data*))
      (values)))
   (values)))

(defun move-x (val)
  (setf *cur-pos*
        (let ((new-pos (list (+ val (first *cur-pos*)) (second *cur-pos*))))
          (vector-push (list *cur-pos* new-pos) *x-axis*)
          new-pos)))

(defun move-y (val)
  (setf *cur-pos*
        (let ((new-pos (list (first *cur-pos*) (+ val (second *cur-pos*)))))
          (vector-push (list *cur-pos* new-pos) *y-axis*)
          new-pos)))

;; Check experiments.lisp.dont for the whys and hows for this macro and the rest
(defmacro set-move-char (move &rest body)
  `(set-macro-character ,move (lambda (s c)
                              (declare (ignore s c))
                              ,@body
                              (values))))

(set-move-char #\R (move-x (read)))
(set-move-char #\L (move-x (- (read))))
(set-move-char #\U (move-y (read)))
(set-move-char #\D (move-y (- (read))))

(read t nil)
(format t "~a~%" *cable-route-data*)


