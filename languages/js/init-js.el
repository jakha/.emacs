(load (concat user-emacs-directory "languages/js/init-js2.el"))

(load (concat user-emacs-directory "languages/js/init-npm-mode.el"))

(load (concat user-emacs-directory "languages/js/eslint-fix.el"))

(add-hook 'js2-mode-hook #'lsp-deferred)

(eval-after-load 'js2-mode
	   '(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))
