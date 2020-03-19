(use-package company
 :ensure t
 :config
 (setq company-idle-delay 0.3)
 (global-company-mode 1)
 (global-set-key (kbd "C-<tab>") 'company-complete))
