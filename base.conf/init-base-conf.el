;; remove menu from head
(menu-bar-mode -1)
;; remove toolbar from head
(tool-bar-mode -1)
;; remove scroll bar
(scroll-bar-mode -1)
;; to actualize buffer if file change on buffer
(global-auto-revert-mode 1)
;; change cursor type to | 
(setq-default cursor-type 'bar)
;; to save 
(auto-save-visited-mode)
;;off sound bell
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))
(setq visible-bell 1)

(desktop-save-mode 1)

(delete-selection-mode t)  ; delete seleted text when typing

(setq-default tab-width 4)


;;(load (concat user-emacs-directory "base.conf/init-desktop-revert.el"))

;;(my-desktop)

;; to not show line toggle sign 
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil) ;; no continuation indicators
      ;; '(nil right-curly-arrow) ;; right indicator only
      ;; '(left-curly-arrow nil) ;; left indicator only
      ;; '(left-curly-arrow right-curly-arrow) ;; default
      )



(defun buffer-background-black ()
  "."
  (interactive)
  (setq buffer-face-mode-face `(:background "black"))
  (buffer-face-mode 1))

(add-hook 'post-command-hook
          (lambda ()
            (let ((messages (get-buffer "*Messages*")))
              (unless (eq (current-buffer) messages)
                (with-current-buffer messages
                  (goto-char (point-max)))))))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))


(require 'dash-functional)

