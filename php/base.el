;; Put follow code into init.el
(when (file-directory-p (concat user-emacs-directory "php/php-mode"))
  (load (concat user-emacs-directory "php/php-mode/php-mode-autoloads.el")))
  
(when (file-directory-p (concat user-emacs-directory "php/company-mode"))
      (load (concat user-emacs-directory "php/company-mode/company.el")))

(unless (package-installed-p 'ac-php)
    (package-refresh-contents)
    (package-install 'ac-php))

;;auto-completion
(require 'php-mode)			

(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable auto-complete-mode
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources '(ac-source-php))

             ;;(company-mode t)
	     ;; Enable company-mode
            ;; (require 'company-php)
	     
             ;; As an example (optional)
             (yas-global-mode 1)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

	     ;; (set (make-local-variable 'company-backends)
             ;;      '((company-ac-php-backend company-dabbrev-code)
             ;;        company-capf company-files))
	     
             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))


(message "lol")
