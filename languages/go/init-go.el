(load (concat user-emacs-directory "languages/go/init-go-mode.el"))

;;(load (concat user-emacs-directory "languages/go/init-go-eldoc.el"))

;;(load (concat user-emacs-directory "languages/go/init-company-go.el"))

;;(load (concat user-emacs-directory "languages/go/init-go-rename.el"))

;;(load (concat user-emacs-directory "languages/go/init-gotest.el"))

;;(load (concat user-emacs-directory "languages/go/init-goscratch.el"))

;;(load (concat user-emacs-directory "languages/go/init-go-direx.el"))

;;(load (concat user-emacs-directory "languages/go/init-go-guru.el"))

;;(load (concat user-emacs-directory "languages/go/init-multicompile.el"))

;;(add-hook 'before-save-hook 'gofmt-before-save)

;; (setq-default gofmt-command "goimports")
;; (add-hook 'go-mode-hook 'go-eldoc-setup)
;; (add-hook 'go-mode-hook (lambda ()
;;                             (set (make-local-variable 'company-backends) '(company-go))
;;                             (company-mode)))
;; ;;(add-hook 'go-mode-hook 'yas-minor-mode)
;; (add-hook 'go-mode-hook 'flycheck-mode)

(require 'cl-macs)

(defun goja-run (run-file)
  "RUN-FILE."
  (interactive)
  (projectile-run-compilation
   (lambda ()
	 (setf default-directory (projectile-project-root))
	 (let ((compilation-buffer-name (concat "*" run-file "*")))
	   (when (not (null  (get-buffer compilation-buffer-name)))
		 (let ((kill-buffer-query-functions nil))
		   (kill-buffer compilation-buffer-name)))
	   (compile	(concat "go run -v " run-file) nil)
	   (ja-rename-buffer "*compilation*" compilation-buffer-name)))))

(cl-defun ja-rename-buffer (old-name new-name)
  "OLD-NAME NEW-NAME."
  (when (eq (buffer-name) old-name)
	(rename-buffer new-name)
	(return-from ja-rename-buffer))
  (let ((remembered-buffer (buffer-name)))
	(switch-to-buffer old-name)
	(rename-buffer new-name)
	(switch-to-buffer remembered-buffer)))


(defun ide-run-last-build ()
  "."
  (interactive)
  (setq *context*
		(load-json-file-to-hash-table
		 (get-config-path)))
  (run-last-build *context*))

(defun run-last-build(config-obj)
  "CONFIG-OBJ."
   (goja-run (gethash "last-build" (gethash "compile" config-obj))))

;;(add-to-list 'yas-snippet-dirs "~/.emacs.d/languages/go/yasnippet-go/go-mode")

(add-hook 'go-mode-hook 'create-go-ide-dir)

(defun create-go-ide-dir ()
  "Will create .emacs-go-ide directory in root of project if not exist."
  (let* ((go-mod-path (locate-dominating-file buffer-file-name "go.mod"))
		 (git-dir-path (locate-dominating-file buffer-file-name ".git"))
		 (path-to-create go-mod-path))
	(when (null go-mod-path)
	  (if (null git-dir-path)
		  (setq path-to-create default-directory)
		(setq path-to-create git-dir-path)))
	(when (not (file-directory-p (concat path-to-create "/.emacs-go-ide")))
	  (make-directory (concat path-to-create "/.emacs-go-ide")))))


(defun get-config-path ()
  "Will return go IDE config path."
  (concat (locate-dominating-file buffer-file-name ".emacs-go-ide")
		  ".emacs-go-ide/config.json"))

(defun goja-add-to-build-list (build-path)
  "Add BUILD-PATH to build-path list in config."
  (let* ((config-obj (load-json-file-to-hash-table (get-config-path)))
		 (compile-obj (gethash "compile" config-obj))
		 (build-list (gethash "build-list" compile-obj)))
	(when (null build-list)
	  (setq build-list (list)))
	(add-to-list 'build-list  build-path)
    (puthash "build-list" build-list compile-obj)
	(puthash "compile" compile-obj config-obj)
	(persist-go-ide-config config-obj)))


(defun persist-go-ide-config (config-obj)
  "CONFIG-OBJ IDE object to save."
  (write-region
   (json-encode config-obj) nil
   (get-config-path)))

(defun pick-to-build (config-obj)
  "CONFIG-OBJ."
  (interactive)
  (ivy-completing-read "Choose build: "
					   (gethash "build-list"
								(gethash "compile"
										 config-obj))))

(defun build-current-buffer-main()
  "."
  (interactive))

(defvar-local *context* (list) "Context contain all info about alias, kubeconfig, namespace for kubernetes.")

(defun ide-pick-to-build ()
  "."
  (interactive)
  (setq *context* (load-json-file-to-hash-table (get-config-path)))
  (let ((build-path (pick-to-build *context*)))
	(goja-run build-path)
	(set-as-last-build build-path *context*)
	(persist-go-ide-config *context*)))

(defun set-as-last-build (build-path config-obj)
  "BUILD-PATH CONFIG-OBJ ."
  (let* ((compile (gethash "compile" config-obj)))
	(puthash "last-build" build-path compile)
	(puthash "compile" compile config-obj))
  config-obj)

(define-transient-command goja-build-transient ()
  ["Actions"
   ("c" "current main" build-current-buffer-main)
   ("p" "pick build" ide-pick-to-build)])

(provide 'init-go)
;;; init-go.el ends here
