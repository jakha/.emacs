;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path (concat user-emacs-directory "utils/"))
(require 'load-directory)		

(load-directory (concat user-emacs-directory "themes/"))
(load-directory (concat user-emacs-directory "kbd/"))

(require 'package)
(add-to-list 'package-archives
             '("MELPA Stable" . "http://stable.melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (treemacs-projectile use-package projectile counsel ivy doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ivy-mode 1)
(require 'projectile)
(setq projectile-completion-system 'ivy)
(projectile-mode +1)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    ( define-key winum-keymap (kbd "<f12>") #'treemacs))
  :config
  (progn
    (setq treemacs-width 25
	  treemacs-toggle-fixed-width t))
  :bind
  (:map global-map
	("<f12>" . treemacs)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
