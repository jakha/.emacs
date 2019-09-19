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

;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner (concat user-emacs-directory "themes/imgs/logo1.png"))
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" which displays whatever image you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
