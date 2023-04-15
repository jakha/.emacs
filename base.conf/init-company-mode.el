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


(require 'company)
(use-package company-box
  :ensure t
  :after company
  :init (setq company-box-enable-icon nil)
  :hook (company-mode . company-box-mode))

(setq company-fuzzy-prefix-on-top t)
