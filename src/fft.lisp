#|
; load without running tests 
(load "fft.lisp")

; load with running tests
(let ((*features* (cons :production *features*)))
  (load "fft.lisp"))
|#
(defpackage :fft
<<<<<<< HEAD
  (:use :common-lisp)
  (:export #:main))
=======
    (:use :common-lisp) 
    (:export #:main))
>>>>>>> f10f4feb0ad7ad82a1050dbe3f6e2e98a6af706f

(in-package :fft)
;; (setf sb-ext:*compiler-print-variable-alist* 
;;   '((*PRINT-LENGTH* . 10) (*PRINT-LEVEL* . 10) 
;;                       (*PRINT-PRETTY* . t)))

(defun my-load  (f)
  (handler-bind ((style-warning #'muffle-warning))
     (load f)))


;;; load standard stuff
<<<<<<< HEAD
(load "macros") 
(load "tests")
(load "rand")
(load "lists")
(load "strings")
(load "fun")
;;; load stuff for fft
;(load "abcd")
(my-load "cols")
 
(my-load "table")

(load "main")
(sb-ext:exit)
=======
;;; Muffle compiler-notes globally
;(declaim (sb-ext:muffle-conditions sb-ext:compiler-note))
>>>>>>> f10f4feb0ad7ad82a1050dbe3f6e2e98a6af706f

(handler-bind ((style-warning #'muffle-warning))
  (load "globals")
  (load "macro") 
  (load "test")
  (load "sys")
  (load "fun")
  (load "rand")
  (load "list")
  (load "hash")
  (load "string")
  ;;; load stuff for fft
  (load "abcd")
  (load "col")
  (load "table")
  (load "main")) 

(defun egs (&key (file "weathernumerics"))
  (let ((g (format nil "../data/~a.lisp" file)))
    (assert  (probe-file g) (g) "missing file ~a" g)
    (format t "; loading ~a ...~%" g)
    (with-open-file
        (in g :direction :input)
      (apply #'data (read in)))))  

(deftest weather ()
  "load the smallest file possible"
  (let* ((tab (egs :file "weathernumerics"))
         (kcol (table-klassCol tab)))
    (test 14 (length (table-egs tab)))
    (test 65 (num-lo (first (table-num tab))))
    (print (sym-keys kcol))
    tab
    (score tab)
;;     (dolist (col (table-sym tab))
;;       (print (col-name col))
;;       (results-show
;;         (results! 
;;          (sym-results col))))
;;   ; (table-results0  tab)
  ; (score tab)
   ))

(deftest helloWorld (&key (salutation "hello")
                          (person "world"))
  (format t "~a ~a~%" salutation person))

#+tdd (main)
 
