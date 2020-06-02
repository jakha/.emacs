(use-package js2-mode
  :ensure t)

(use-package json-mode
  :ensure t)


(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))))
