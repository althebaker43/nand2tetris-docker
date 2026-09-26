(set-variable 'fill-prefix "    ")

(defun always-insert-indent () (insert "    "))
(set-variable 'indent-line-function 'always-insert-indent)
