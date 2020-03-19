;; remove menu from head
(menu-bar-mode -1)
;; remove toolbar from head
(tool-bar-mode -1)
;; remove scroll bar
(scroll-bar-mode -1)


(add-to-list 'load-path "~/.emacs.d/base.conf")

(require 'init-lsp-mode)
