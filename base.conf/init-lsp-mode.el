(use-package lsp-mode
  :ensure t
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
		 (go-mode . lsp))
  :commands lsp)

;; optionally
;; (use-package lsp-ui
;;   :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)
