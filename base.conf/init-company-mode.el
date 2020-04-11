(use-package company
 :ensure t
 :config
 (setq company-idle-delay 0.3)
 (global-set-key (kbd "C-<tab>") 'company-complete))

(global-company-mode 1)

(setq company-minimum-prefix-length 1)

(use-package company-go
  :ensure t)

(use-package company-php
  :ensure t)
