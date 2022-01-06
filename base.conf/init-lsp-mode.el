(use-package lsp-mode
  :ensure t
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
		 (go-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  (setq
       lsp-enable-snippet t
	   lsp-completion-enable t
	   lsp-headerline-breadcrumb-icons-enable t
	   lsp-completion-provider :none))

(add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list
  :config
  (lsp-treemacs-sync-mode 1))

(setq lsp-file-watch-threshold 1000)

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)

(use-package which-key
  :ensure t
  :config  (which-key-mode))


(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

(load (concat user-emacs-directory "base.conf/init-lsp-go-client.el"))


;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(custom-set-variables
 '(lsp-completion-provider :none)
 )

 (setq company-backends '((company-files :with
                                       company-yasnippet)
                        (company-capf :with
                                      company-yasnippet)
                        (company-dabbrev-code
                         company-gtags
                         company-etags
                         company-keywords)))

(add-hook
'go-mode-hook
 '(lambda ()
  (set
   (make-local-variable
    'company-backends)
     '((company-capf :with company-yasnippet)
      (company-dabbrev-code
       company-gtags
        company-etags
         company-keywords :with
          company-yasnippet)
           (company-files :with company-yasnippet)
            (company-dabbrev :with company-yasnippet)))))
