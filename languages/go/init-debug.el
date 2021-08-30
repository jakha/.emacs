(load (concat user-emacs-directory "go-dlv.el/go-dlv.el"))

;;(setq dap-auto-configure-features '(sessions locals controls tooltip))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :commands dap-debug
  :custom
  (dap-auto-configure-features '(sessions locals breakpoints expressions repl controls tooltip))
  :config
  (require 'dap-node)
  (dap-node-setup)
  (require 'dap-go)
  (dap-go-setup)
  (require 'dap-hydra)
  (require 'dap-gdb-lldb)
  (dap-gdb-lldb-setup)
  (dap-mode 1)
  (dap-auto-configure-mode 1))

;(dap-mode 1)

;; (require 'dap-go)

;; (require 'lsp-lens)
;; (dap-go-setup)
;; (dap-ui-mode 1)
;; (dap-tooltip-mode 1)
;; (tooltip-mode 1)
;; (dap-ui-controls-mode 1)
(setq dap-print-io t)

;; (add-hook 'dap-stopped-hook
;;           (lambda (arg) (call-interactively #'dap-hydra)))
