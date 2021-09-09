
(use-package vterm
    :ensure t)

(defun make-terminal (terminal-name)
  "TERMINAL-NAME ."
  (let ((buffer-name (concat "*" terminal-name "*")))
	(when (null (get-buffer-window buffer-name))
	  (if (null  (get-buffer buffer-name))
		  (progn
		  (split-window-below)
		  (back-window)
		  (switch-to-buffer (make-term terminal-name "/bin/bash"))
		  (term-mode)
		  (term-char-mode))
		(progn
		(split-window-below)
		(back-window)
		(switch-to-buffer  buffer-name))))))
