(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; auto refresh buffers
(global-auto-revert-mode 1)

;; cursor type
(setq-default cursor-type 'bar)
(use-package all-the-icons)

(require 'page-break-lines)
(global-page-break-lines-mode)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
