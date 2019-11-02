
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path (concat user-emacs-directory "utils/"))
(require 'load-directory)
(load "add-elpa-melpa.el")
(load  (concat user-emacs-directory "php/base.el")) 

(load-directory (concat user-emacs-directory "themes/"))
(load-directory (concat user-emacs-directory "kbd/"))
(load-directory (concat user-emacs-directory "git/"))
(load-directory (concat user-emacs-directory "sbcl/"))


(setq-default phpstan-executable 'docker)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (docker-compose-mode dockerfile-mode phpactor php-eldoc flymake-php flycheck-phpstan phpstan phpcbf xah-elisp-mode rainbow-delimiters smartparens flylisp ac-php web-mode magit no-littering page-break-lines cnfonts treemacs-projectile use-package projectile counsel ivy doom-themes)))
 '(phpcbf-executable "/usr/bin/phpcbf")
 '(phpcbf-standard "PSR2")
 '(safe-local-variable-values
   (quote
    ((phpstan-level . max)
     (phpstan-config-file default-directory . "phpstan-custom.neon")
     (phpstan-working-dir default-directory)
     (phpstan-executable . docker)
     (php-project-root . auto)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;ivy.gitignore
(ivy-mode 1)

(require 'smartparens-config)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;projectile
(require 'projectile)
(setq projectile-completion-system 'ivy)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)
(projectile-mode +1)

;;treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    ( define-key winum-keymap (kbd "<f12>") #'treemacs))
  :config
  (progn
    (setq treemacs-width 25
	  treemacs-toggle-fixed-widt t))
  :bind
  (:map global-map
	("<f12>" . treemacs)
	("C-t" . treemacs-add-project-to-workspace)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package uniquify
  :init  ;; nicer naming of buffers for files with identical names
  (setq uniquify-buffer-name-style   'reverse
        uniquify-separator           " • "
        uniquify-after-kill-buffer-p t
        uniquify-ignore-buffers-re   "^\\*"))

;;use littering
(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))
(require 'no-littering)

(smartparens-global-mode)

(require 'web-mode)

;; session
;; (use-package session
;;   :defer    t
;;   :hook ((after-init . session-initialize))
;;   :init
;;   (setq session-save-file (no-littering-expand-var-file-name ".session")
;;         session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)"
;;         session-save-file-coding-system 'utf-8
;;         desktop-globals-to-save
;;         (append '((comint-input-ring        . 50)
;;                   (compile-history          . 30)
;;                   desktop-missing-file-warning
;;                   (dired-regexp-history     . 20)
;;                   (extended-command-history . 30)
;;                   (face-name-history        . 20)
;;                   (file-name-history        . 100)
;;                   (grep-find-history        . 30)
;;                   (grep-history             . 30)
;;                   (ivy-history              . 100)
;;                   (magit-revision-history   . 50)
;;                   (minibuffer-history       . 50)
;;                   (org-clock-history        . 50)
;;                   (org-refile-history       . 50)
;;                   (org-tags-history         . 50)
;;                   (query-replace-history    . 60)
;;                   (read-expression-history  . 60)
;;                   (regexp-history           . 60)
;;                   (regexp-search-ring       . 20)
;;                   register-alist
;;                   (search-ring              . 20)
;;                   (shell-command-history    . 50)
;;                   tags-file-name
;;                   tags-table-list
;;                   kill-ring))))
