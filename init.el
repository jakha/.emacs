(require 'package)

;; add helpers
(load "~/.emacs.d/utils.elc")

;; add melpa package archive
(if (not (is-repo-added-to-package-archives "melpa"))
    (load "~/.emacs.d/add-melpa.elc"))

;; install use package================================================================================

;; (let ((default-directory "~/.emacs.d"))
;;   (shell-command-to-string "git clone https://github.com/jwiegley/use-package.git ~/.emacs.d/site-lisp/use-package"))

;; (let ((default-directory "~/.emacs.d/site-lisp/use-package"))
;;   (shell-command-to-string "echo 'LOAD_PATH  = -L ~/.emacs.d/site-lisp/use-package' > config.mk && make"))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
;; (require 'use-package)

;; (with-eval-after-load 'info
;;   (info-initialize)
;;   (add-to-list 'Info-directory-list
;;                "~/.emacs.d/site-lisp/use-package/"))

;;====================================================================================================


;; (add-to-list 'load-path "~/.emacs.d/base.conf")

;; (require 'init-base-conf)

;; (add-to-list 'load-path "~/.emacs.d/php")

;; (require 'init-php-suite)
