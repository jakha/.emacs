;;; package --- emacs
;;; Commentary:

(require 'package)

;;; Code:
;; add helpers
(load "~/.emacs.d/utils.el")

;; add melpa package archive
(if (not (is-repo-added-to-package-archives "melpa"))
    (load "~/.emacs.d/add-melpa.el"))

;; install use package
(when (not (require 'use-package nil 'NOERROR))
  (load "~/.emacs.d/add-use-package.el"))

;; load independet from packages configs
(load "~/.emacs.d/base.conf/init-base-conf.el")

(unless (not package-archive-contents)
  (load "~/.emacs.d/base.conf/init-repository-packages.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-php-phpcs-executable "~/.emacs.d/languages/php/phpcbf/bin/phpcs")
 '(package-selected-packages
   (quote
    (magit phpcbf company-php composer web-mode projectile diminish all-the-icons dashboard counsel swiper ivy php-project company-go lsp-go docker lsp-docker go-mode sublimity smooth-scrolling smartparens php-mode lsp-ui flycheck company)))
 '(php-mode-coding-style (quote psr2))
 '(phpcbf-executable (concat php-cbf-dir "/bin/phpcbf"))
 '(phpcbf-standard "PSR12"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode)))


(load (concat user-emacs-directory "themes/nord.el"))

;; other window
;; (define-key global-map (kbd "C-<right>") 'other-window)
;; (define-key global-map (kbd "C-<left>") 'back-window)
(progn
  (global-set-key (kbd "C-<right>") 'other-window)
  (global-set-key (kbd "C-<left>") 'back-window))
