;;(load (concat user-emacs-directory "kbd/php.el"))

(load (concat user-emacs-directory "kbd/magit.el"))

(load (concat user-emacs-directory "kbd/init-go.el"))

(load (concat user-emacs-directory "kbd/init-lsp.el"))

(load (concat user-emacs-directory "kbd/init-origami.el"))




(define-key projectile-mode-map (kbd "M-<f12>") 'ide-make-terminal)
