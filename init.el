
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

(load-directory (concat user-emacs-directory "themes/"))
(load-directory (concat user-emacs-directory "kbd/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (page-break-lines cnfonts treemacs-projectile use-package projectile counsel ivy doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;ivy
(ivy-mode 1)

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
	  treemacs-toggle-fixed-width 1))
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