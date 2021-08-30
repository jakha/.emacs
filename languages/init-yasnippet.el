(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
	:ensure t)
  (yas-reload-all))

(add-hook 'go-mode-hook 'yas-minor-mode)
