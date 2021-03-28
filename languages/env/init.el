;;; package --- Summary
;;; Code:
;;; Commentary:
;;;

(defun load-env (path)
  "Will load environment variables from PATH."
  (load-lines (read-lines path)))

(defun load-lines (lines)
  "LINES ."
  (when (not (null lines))
    (export-env (car lines))
    (load-lines (cdr lines))))

(defun read-lines (path)
  "Return a list of lines of a file at file PATH."
  (with-temp-buffer
    (insert-file-contents path)
    (split-string (buffer-string) "\n" t)))

(defun export-env (line)
  "LINE ."
  (let ((splited-line (split-env-line line)))
    (setenv (car splited-line)
	    (car(cdr splited-line)))))

(defun split-env-line (line)
  "LINE it is a string."
  (split-string-by-index (cl-search "=" line) line))

  
(defun split-string-by-index (index need-to-be-split)
  "Will split string NEED-TO-BE-SPLIT by INDEX of character."
  (list (substring need-to-be-split  0 index)
	(substring need-to-be-split (+ index 1))))

(provide 'init)
;;; init.el ends here
