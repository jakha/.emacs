;;; package --- use package installing
;;; Commentary:

(when (not (file-directory-p "~/.emacs.d/site-lisp/use-package"))
  (let ((default-directory "~/.emacs.d"))
    (shell-command-to-string "git clone https://github.com/jwiegley/use-package.git ~/.emacs.d/site-lisp/use-package"))
  (let ((default-directory "~/.emacs.d/site-lisp/use-package"))
    (shell-command-to-string "echo 'LOAD_PATH  = -L ~/.emacs.d/site-lisp/use-package' > config.mk && make")))
(when (not (file-directory-p "~/.emacs.d/site-lisp/use-package"))
  (let ((default-directory "~/.emacs.d"))
    (shell-command-to-string "git clone https://github.com/jwiegley/use-package.git ~/.emacs.d/site-lisp/use-package"))
  (let ((default-directory "~/.emacs.d/site-lisp/use-package"))
    (shell-command-to-string "echo 'LOAD_PATH  = -L ~/.emacs.d/site-lisp/use-package' > config.mk && make")))

(defun load-use-package ()
  (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
  (require 'use-package)
  (with-eval-after-load 'info
    (info-initialize)
    (add-to-list 'Info-directory-list
		 "~/.emacs.d/site-lisp/use-package/")))


(load-use-package)
