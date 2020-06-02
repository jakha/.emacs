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
 '(custom-safe-themes
   (quote
    ("3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "e60d4fcb2484191f98a62017b6aae4dd12c676d13ba248f0f898b5bef32e9db4" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(flycheck-php-phpcs-executable "~/.emacs.d/languages/php/phpcbf/bin/phpcs")
 '(package-selected-packages
   (quote
    (javascript-eslint exec-path-from-shell npm-mode js2-mode lsp-ivy poly-php poly-markdown polymode yasnippet-go multi-compile go-scratch go-guru go-direx goscratch gotest go-rename go-eldoc flycheck-phpstan ac-php company-php magit phpcbf composer web-mode projectile diminish all-the-icons dashboard counsel swiper ivy php-project company-go lsp-go docker lsp-docker go-mode sublimity smooth-scrolling smartparens php-mode lsp-ui flycheck company)))
 '(php-mode-coding-style (quote psr2))
 '(phpcbf-executable (concat php-cbf-dir "/bin/phpcbf"))
 '(phpcbf-standard "PSR12"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(load (concat user-emacs-directory "themes/nord.el"))

;; other window
;; (define-key global-map (kbd "C-<right>") 'other-window)
;; (define-key global-map (kbd "C-<left>") 'back-window)
(progn
  (global-set-key (kbd "C-<right>") 'other-window)
  (global-set-key (kbd "C-<left>") 'back-window))
