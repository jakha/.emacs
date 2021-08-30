(use-package protobuf-mode
  :ensure t)


(defun open-konsole ()
  (interactive)
  (call-process "konsole" nil 0 nil "--workdir" default-directory))
