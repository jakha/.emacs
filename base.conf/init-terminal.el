

(defun make-terminal (terminal-name)
  "TERMINAL-NAME ."
  (when (null  (get-buffer (concat "*" terminal-name "*")))
	(split-window-below)
	(back-window)
	(switch-to-buffer  (make-term terminal-name "/bin/bash"))
	(term-mode)
	(term-char-mode)))



