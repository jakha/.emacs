(use-package swiper
  :ensure t)

(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
