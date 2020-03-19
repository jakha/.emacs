;; remove menu from head
(menu-bar-mode -1)
;; remove toolbar from head
(tool-bar-mode -1)
;; remove scroll bar
(scroll-bar-mode -1)

(global-auto-revert-mode 1)

(setq-default cursor-type 'bar)

(require 'init-company-mode)

(require 'init-smartparens)

(require 'init-flycheck)

(require 'init-lsp-mode)

