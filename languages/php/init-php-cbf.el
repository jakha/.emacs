;;; package --- php codesniffer
;;; Commentary:

;;; Code:
(setq php-cbf-dir "~/.emacs.d/languages/php/phpcbf")

(when (not (file-directory-p php-cbf-dir))
  (let ((default-directory "~/.emacs.d"))
    (shell-command-to-string (concat "git clone https://github.com/squizlabs/PHP_CodeSniffer.git " php-cbf-dir))))

(use-package phpcbf
  :ensure t)

(custom-set-variables
 '(phpcbf-executable (concat php-cbf-dir "/bin/phpcbf"))
 '(phpcbf-standard "PSR12"))

;; Auto format on save.
(add-hook 'php-mode-hook 'phpcbf-enable-on-save)
