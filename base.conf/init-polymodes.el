(use-package polymode
  :ensure t)

(use-package poly-markdown
  :ensure t)


(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))


(load (concat user-emacs-directory "site-lisp/poly-php.el"))
