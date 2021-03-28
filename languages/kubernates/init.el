
;; TODO обновление данных по статусу Terminating
;; добавить сортировку по алфавиту для подов
;;


(define-derived-mode kubernetes-mode tabulated-list-mode "k8s"
  "Kubernetes mode"
  (kubernetes-get-pods "dbx" "/home/jaha/.kube/config"))

(defun kubernetes ()
  (interactive)
  (kubernetes-mode))



(defun kubernetes-get-pods (namespace kube-config-path)
  (let ((kube-proc (start-process "get-pods" "*get-pods*" "kubectl" "get" "pods"
				  (concat "-n" namespace)
				  "--no-headers=true"
				  (concat "--kubeconfig=" kube-config-path))))
    (set-process-filter kube-proc (handle-get-pods-output))))

(defun handle-get-pods-output ()
  "Solo"
  (lexical-let ((lexRemainder (list))
		(virtualTable (make-hash-table :test 'equal)))
    #'(lambda (proc podsData)
	(cl-multiple-value-bind (tableFromKube newRemainder)
	    (prepare-data-for-table (split-string podsData "\n") lexRemainder)
	  (setq virtualTable (put-from-hash-table tableFromKube virtualTable))
	  (drow-table (hash-table-values virtualTable))
	  (setq lexRemainder newRemainder)))))

(defun put-from-hash-table (dataFromKube virtualTable)
  (maphash (lambda (key value)
	     (puthash key value virtualTable))
	   dataFromKube)
  virtualTable)

(defun drow-table (rows)
  (switch-to-buffer  "*get-pods-result*")
  (setq tabulated-list-format (get-pods-columns))
  (tabulated-list-watch-line-number-width )
  ;; (setq tabulated-list-sort-key (cons "NAME" . nil))
  (setq tabulated-list-entries rows)
  (tabulated-list-init-header)
  (tabulated-list-print))

(defun prepare-data-for-table (podRowList remainder)
  "ssd"
  (cl-multiple-value-bind (normalizedData newRemainder) (split-and-normalize podRowList remainder)
    (let ((virtualTable (make-hash-table :test 'equal)))
      (dolist (row normalizedData)
	(puthash (nth 0 row)
		 `(nil [,(nth 0 row) ,(nth 1 row) ,(nth 2 row) ,(nth 3 row) ,(nth 4 row)]) virtualTable))
      (cl-values virtualTable newRemainder))))

(defun split-and-normalize (podRowList remainder)
  "Ola"
  (let ((participatedData remainder)
	(resultData (list)))
    (loop for podRow in podRowList do
	  (block loop-start
	    (let ((rowData (remove-empty-string (split-string podRow " "))))
	      (when (or (< (length rowData) 5)
			(= (length rowData) 5))
		(let ((collectedData (append participatedData rowData)))
		  (if (> (length collectedData) 5)
		      (setq participatedData (try-to-concat-string participatedData rowData))
		    (setq participatedData collectedData))))
	      (when (= (length participatedData) 5)
		(setq resultData (append resultData (list participatedData)))
		(setq participatedData (list))
		(return-from loop-start))
      	      (when (> (length participatedData) 5)
		(print participatedData)
		(error "Smth goes wrong")))))
    (cl-values resultData participatedData)))

(defun try-to-concat-string (participatedList rowData)
  (append
   (butlast participatedList)
   (list (concat (first (last participatedList)) (first rowData)))
   (rest rowData)))

(defun remove-empty-string (stringList)
  (seq-filter (lambda (x)
		(not (string= "" x)))
   stringList))

(defun get-pods-columns ()
  [("NAME" 50 t) ("READY" 10 nil) ("STATUS" 20 nil) ("RESTARTS" 10 nil) ("AGE" 10 nil)])
