(use-package cnfonts
  :disabled t
  :straight t
  :init
  (gsetq cnfonts-directory (no-littering-expand-etc-file-name "cnfonts"))
  :hook ((after-init . cnfonts-enable))
  :config
  (defun nasy/set-symbol-fonts (fontsize-list)
    "Set symbol fonts with FONTSIZE-LIST."
    (let* ((fontname "Fira Code Symbol")
           (fontsize (nth 0 fontsize-list))
           (fontspec (font-spec :name fontname
                                :size fontsize
                                :weight 'normal
                                :slant 'normal)))
      (if (cnfonts--fontspec-valid-p fontspec)
          (set-fontset-font t '(#Xe100 . #Xe16f) fontspec)
        (message "Font %S not exists！" fontname))))
  (defun nasy/set-symbol-extra-fonts (fontsize-list)
    "Set extra symbol fonts with FONTSIZE-LIST."
    (let* ((fontname "Arial")
           (fontsize (nth 0 fontsize-list))
           (fontspec (font-spec :name fontname
                                :size fontsize
                                :weight 'normal
                                :slant 'normal)))
      (if (cnfonts--fontspec-valid-p fontspec)
          (set-fontset-font t '(#X1d400 . #X1d744) fontspec)
        (message "Font %S not exists！" fontname))))
  (add-hook #'cnfonts-set-font-finish-hook #'nasy/set-symbol-fonts)
  (add-hook #'cnfonts-set-font-finish-hook #'nasy/set-symbol-extra-fonts))

;; (set-face-attribute
;;  'default nil
;;  :font (font-spec :name "Ubuntu Mono"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 12.0))
