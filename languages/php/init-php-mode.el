;;; package --- php
;;; Commentary:
;;; Code:
(use-package php-mode
  :ensure t)

(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "C-c C--") 'php-current-class)
  (define-key php-mode-map (kbd "C-c C-=") 'php-current-namespace))

(setq php-language-files-dir (concat user-emacs-directory "languages/php/files"))

(when (not (file-directory-p php-language-files-dir))
  (dired-create-directory php-language-files-dir))

(setq php-language-doc-archive (concat php-language-files-dir "/doc/phpdoc.tar.gz"))
(setq php-language-doc (concat php-language-files-dir "/doc/php-chunked-xhtml"))

(when (and (not (file-directory-p php-language-doc))
	   (not (file-exists-p php-language-doc-archive)))
  (let ((default-directory php-language-files-dir))
    (url-copy-file "https://www.php.net/distributions/manual/php_manual_en.tar.gz" "phpdoc.tar.gz")))

(when (not (file-directory-p php-language-doc))
  (let ((default-directory php-language-files-dir))
    (shell-command-to-string (concat "tar -xf " php-language-doc-archive))))

(setq php-manual-path php-language-doc)

(delete-file php-language-doc-archive)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))


(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(provide 'init-php-mode)
;;; init-php-mode.el ends here
