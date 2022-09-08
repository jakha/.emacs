(use-package lsp-yaml
  :after lsp
  :config
  (add-hook 'yaml-mode-hook #'lsp))
