
;;
;; Check that is repo by name is exist at package archives list
;;
(defun is-repo-added-to-package-archives (name)  

  (defun is-repo-added (name list)
    (catch 'exist
      (if (string-suffix-p name (car (car list)) t)
	  (throw 'exist t))
      (if list                           
	  (is-repo-added
	   name (cdr list)))))

  (is-repo-added name package-archives))
