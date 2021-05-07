(load (concat user-emacs-directory "languages/go/init-go-mode.el"))

(load (concat user-emacs-directory "languages/go/init-go-eldoc.el"))

(load (concat user-emacs-directory "languages/go/init-company-go.el"))

(load (concat user-emacs-directory "languages/go/init-go-rename.el"))

(load (concat user-emacs-directory "languages/go/init-gotest.el"))

(load (concat user-emacs-directory "languages/go/init-goscratch.el"))

(load (concat user-emacs-directory "languages/go/init-go-direx.el"))

(load (concat user-emacs-directory "languages/go/init-go-guru.el"))

(load (concat user-emacs-directory "languages/go/init-multicompile.el"))

(add-hook 'before-save-hook 'gofmt-before-save)

(setq-default gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))
;;(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'go-mode-hook 'flycheck-mode)


(setq multi-compile-alist '((go-mode . (("go-build" "go build -v"
										 (locate-dominating-file buffer-file-name ".git"))
										("go-run" "go run -v main.go"
										 (locate-dominating-file buffer-file-name "main.go"))))))

(defun run-file-path()
  "."
  (message (buffer-file-name))
  (buffer-file-name))

;;(add-to-list 'yas-snippet-dirs "~/.emacs.d/languages/go/yasnippet-go/go-mode")
