;;; package --- Summary
;;; Code:
;;; Commentary:
;;;

;; TODO обновление данных по статусу Terminating
;; добавить сортировку по алфавиту для подов
;;

(eval-when-compile (require 'cl))
(require 'json)
(require 'ido)
(require 'subr-x)
(require 'transient)
(require 'cl-macs)

(defun k8s ()
  "Let start work with k8s in Emacs."
  (interactive)
  (let* ((pathToJsonConfig (getf (get-constants) :kuberenetes-config-path))
	 (kubeconfig (load-json-file-to-hash-table pathToJsonConfig)))
    (k8s-choose-cluster (gethash "cluster-addresses" kubeconfig))))

(define-derived-mode k8s-mode tabulated-list-mode "k8s"
  "Kubernetes mode"
  (use-local-map k8s-mode-map))

(defun k8s-choose-cluster (environments)
  "ENVIRONMENTS ."
  (interactive)
  (let* ((aliases (hash-table-keys environments))
	 (choosedAlias (k8s-pick-alias aliases)))
    (let ((clusterSettings (gethash choosedAlias environments)))
      (setq *context* clusterSettings)
      (k8s-major-transient))))

(defvar-local *context* (list) "Context contain all info about alias, kubeconfig, namespace for kubernetes.")

(defun k8s-pick-alias (aliases)
  "Function k8s-pick-alias show in ivy ALIASES and return picked by user."
  (interactive)
  (let ((textToShow (getf (get-constants) :choose-k8s-environment)))
    (ivy-completing-read textToShow aliases)))

(define-transient-command k8s-major-transient ()
  ["Actions"
   ("p" "get pods" get-pods)
   ("i" "get ingress" get-ingress)])

(defun get-pods ()
  "."
  (interactive)
  (k8s-get-pods *context*))

(defun get-ingress ()
  "."
  (interactive)
  (k8s-get-ingress *context*))

(defun describe-pod ()
  "."
  (interactive)
  (k8s-describe-pod *context*))

(defun get-logs(&optional args)
  "ARGS."
  (interactive
   (list (transient-args 'k8s-pods-transient)))
  (setq logs-thread (make-thread (k8s-get-logs *context* args) "logs-thread")))

(defun load-json-file-to-hash-table (path)
  "Load json data from PATH, parse and return hash-table with data from file."
  (let* ((json-object-type 'hash-table)
      (json-array-type 'list)
      (json-key-type 'string)
      (kubernetesconfig (json-read-file path)))
    kubernetesconfig))


(defun k8s-get-logs (context &optional args)
  "CONTEXT ARGS ."
  (interactive)
  (lexical-let* ((namespace (gethash "namespace" context))
	 (kubeconfig (gethash "kubeconfig" context))
  	 (alias (gethash "alias" context))
	 (process "*kubectl-get-logs*")
	 (buffer (concat "*" alias "-" "kubectl-logs*"))
	 (pod (aref (tabulated-list-get-entry) 0))
	 (context-l context))
	#'(lambda ()
		"."
		(let* ((kube-proc (start-process process buffer "kubectl" "-n" namespace
										 (concat "--kubeconfig=" kubeconfig)
										 "logs" pod)))
		  (set-process-filter kube-proc (handle-get-logs-output context-l))))))

(defun k8s-describe-pod (context)
  "CONTEXT."
  (interactive)
  (let* ((namespace (gethash "namespace" context))
	 (kubeconfig (gethash "kubeconfig" context))
  	 (alias (gethash "alias" context))
	 (process "*kubectl-describe-pod*")
	 (buffer (concat "*" alias "-" "kubectl-describe-pod*"))
	 (pod (aref (tabulated-list-get-entry) 0))
	 (kube-proc (start-process process buffer "kubectl" "-n" namespace
				   (concat "--kubeconfig=" kubeconfig)
				   "describe" "pod" pod)))
    (set-process-filter kube-proc (handle-describe-pod-output context))))

(defun handle-get-logs-output (context)
  "CONTEXT."
  (let* ((alias (gethash "alias" context))
	 (buffer-name (concat "*" alias "-" "kubectl-logs-output*")))
    (switch-to-buffer buffer-name)
    (lexical-let ((lexical-context context)
				  (lexical-buffer-name  buffer-name)
				  (buffer-name-l buffer-name))
      #'(lambda (proc logs)
		  (b-append
		   (get-buffer buffer-name-l)
		   logs)))))

(defun handle-describe-pod-output (context)
  "CONTEXT."
  (let* ((alias (gethash "alias" context))
	 (buffer-name (concat "*" alias "-" "kubectl-describe-pod-output*")))
    (switch-to-buffer buffer-name)
    (lexical-let ((lexical-context context)
		  (lexical-buffer-name  buffer-name))
      #'(lambda (proc logs)
		  (b-append
		   (get-buffer lexical-buffer-name)
		   logs)))))


(defun k8s-get-pods (context)
  "CONTEXT."
  (interactive)
  (let* ((namespace (gethash "namespace" context))
  	 (kubeconfig (gethash "kubeconfig" context))
  	 (alias (gethash "alias" context))
  	 (process-suffix (getf (get-constants) :get-pods-process-name))
  	 (process-name (concat alias "-" process-suffix))
  	 (process-buffer (concat "*" process-name "*"))
	 (kube-proc (start-process process-name process-buffer "kubectl" "get" "pods"
							   (concat "-n" namespace)
							   "--no-headers=true"
							   (concat "--kubeconfig=" kubeconfig))))
    (set-process-filter kube-proc (handle-get-pods-output context))))

(defun k8s-get-ingress (context)
  "CONTEXT."
  (interactive)
  (let* ((namespace (gethash "namespace" context))
  	 (kubeconfig (gethash "kubeconfig" context))
  	 (alias (gethash "alias" context))
  	 (process-suffix (getf (get-constants) :get-ingress-process-name))
  	 (process-name (concat alias "-" process-suffix))
  	 (process-buffer (concat "*" process-name "*"))
    	 (kube-proc (start-process process-name process-buffer "kubectl" "get" "ingress"
    				  (concat "-n" namespace)
    				  "--no-headers=true"
    				  (concat "--kubeconfig=" kubeconfig))))
    (set-process-filter kube-proc (handle-get-ingress-output context))))


(define-infix-argument k8s-pods-transient:--tail ()
  :description "Tail"
  :class 'transient-option
  :shortarg "-t"
  :argument "--tail=")

(define-transient-command k8s-pods-transient ()
  "Test Transient Title"
  ["Arguments"
   ("-f" "Follow" "fpm")
   (k8s-pods-transient:--tail)]
  ["Actions"
   ("l" "Log" get-logs)
   ("g" "Update buffer" get-pods)
   ("d" "Describe" describe-pod)])

(defun get-constants ()
  "Return constants for this plugin."
  (let ((kubeconfigpath 3))
    `(:get-pods-result-suffix "get-pods-result"
			      :get-pods-process-name "get-pods"
			      :get-ingress-process-name "get-ingress"
			      :kuberenetes-config-path ,(concat user-emacs-directory ".kubernetesconfig")
			      :choose-k8s-environment "Choose kubernetes environment:")))


(defun handle-get-pods-output (context)
  "CONTEXT."
  (lexical-let ((lexRemainder (list))
		(virtualTable (make-hash-table :test 'equal))
		(lexical-context context))
    #'(lambda (proc podsData)
	(cl-multiple-value-bind (tableFromKube newRemainder)
	    (prepare-data-for-table (split-string podsData "\n") lexRemainder)
	  (setq lexRemainder newRemainder)
	  (setq virtualTable (put-from-hash-table tableFromKube virtualTable))
	  (draw-table (hash-table-values virtualTable) lexical-context 'get-pods-columns)))))

(defun handle-get-ingress-output (context)
  "CONTEXT."
  (lexical-let ((lexRemainder (list))
		(virtualTable (make-hash-table :test 'equal))
		(lexical-context context))
    #'(lambda (proc podsData)
	(cl-multiple-value-bind (tableFromKube newRemainder)
	    (prepare-data-for-table (split-string podsData "\n") lexRemainder)
	  (setq lexRemainder newRemainder)
	  (setq virtualTable (put-from-hash-table tableFromKube virtualTable))
	  (draw-table (hash-table-values virtualTable) lexical-context 'get-ingress-columns)))))

(defun put-from-hash-table (dataFromKube virtualTable)
  "DATAFROMKUBE VIRTUALTABLE."
  (maphash (lambda (key value)
	     (puthash key value virtualTable))
	   dataFromKube)
  virtualTable)

(defun make-get-pods-ouput-buffer-name (alias)
  "ALIAS."
(let* ((buffer-output-suffix (getf (get-constants) :get-pods-result-suffix))
       (buffer-name (concat "*" alias "-" buffer-output-suffix "*")))
buffer-name))

(defun draw-table (rows context columns-function)
  "ROWS CONTEXT."
  (let* ((alias (gethash "alias" context))
	 (buffer-name (make-get-pods-ouput-buffer-name alias)))
    (switch-to-buffer  buffer-name)
    (with-current-buffer buffer-name
      (k8s-mode)
      (hl-line-mode)
      (set (make-local-variable '*context*) context))
    (setq tabulated-list-format (funcall columns-function))
    ;; (setq tabulated-list-sort-key (cons "NAME" . nil))
    (setq tabulated-list-entries rows)
    (tabulated-list-init-header)
    (tabulated-list-print)))

(defun prepare-data-for-table (podRowList remainder)
  "PODROWLIST REMAINDER."
  (cl-multiple-value-bind (normalizedData newRemainder) (split-and-normalize podRowList remainder)
    (let ((virtualTable (make-hash-table :test 'equal)))
      (dolist (row normalizedData)
		(puthash (nth 0 row)
				 `(nil [,(nth 0 row) ,(nth 1 row) ,(nth 2 row) ,(nth 3 row) ,(nth 4 row)]) virtualTable))
      (cl-values virtualTable newRemainder))))

(defun split-and-normalize (podRowList remainder)
  "PODROWLIST REMAINDER."
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
		(error "Smth goes wrong")))))
    (cl-values resultData participatedData)))

(defun try-to-concat-string (participatedList rowData)
  "."
  (append
   (butlast participatedList)
   (list (concat (first (last participatedList)) (first rowData)))
   (rest rowData)))

(defun remove-empty-string (string-list)
  "STRING-LIST."
  (seq-filter (lambda (x)
		(not (string= "" x)))
   string-list))


(defun get-pods-columns ()
  "."
  [("NAME" 50 t) ("READY" 10 nil) ("STATUS" 20 nil) ("RESTARTS" 10 nil) ("AGE" 10 nil)])

(defun get-ingress-columns ()
  "."
  [("NAME" 30 t) ("HOSTS" 60 t) ("ADDRESS" 15 nil) ("PORTS" 5 nil) ("AGE" 5 nil)])


(defvar k8s-mode-map nil "Keymap for `k8s-mode-map'.")

(progn
  (setq k8s-mode-map (make-sparse-keymap))
  (define-key k8s-mode-map (kbd "m") 'k8s-pods-transient)
  (define-key k8s-mode-map (kbd "u") 'get-pods)
  (define-key k8s-mode-map (kbd "l") 'get-logs)
  (define-key k8s-mode-map (kbd "d") 'describe-pod))



(use-package syslog-mode
  :ensure t)

(provide 'init)
;;; init.el ends here


(defun my-thread ()
  
  (while t
  (sleep-for 0.5)
  (b-append (get-buffer "*stage-rus-get-pods*") "blyat\n")))

(make-thread #'my-thread "my thread")

(all-threads)
(current-thread)
