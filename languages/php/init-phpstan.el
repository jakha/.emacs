(shell-command-to-string "docker pull phpstan/phpstan")

(setq-default phpstan-executable 'docker)


(use-package flycheck-phpstan
  :ensure t)
