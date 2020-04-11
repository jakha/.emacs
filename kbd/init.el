;; buffer split and close
(define-key global-map (kbd "M-1") 'delete-other-windows)
(define-key global-map (kbd "M-2") 'split-window-right)
(define-key global-map (kbd "M-3") 'split-window-below)
(define-key global-map (kbd "M-0") 'delete-window)

;; save
(define-key global-map (kbd "M-s") 'save-buffer)

;; kill buffer
(define-key global-map (kbd "C-k") (lambda () (interactive) (kill-buffer (buffer-name))))
  
;; cut and paste to alt kbd
(define-key global-map (kbd "M-q") 'kill-region)
(define-key global-map (kbd "M-e") 'yank)
(define-key global-map (kbd "C-a") 'mark-whole-buffer)

(define-key global-map (kbd "C-z") 'undo)

;; switch buffer, file and project ido mode
(define-key global-map (kbd "M-b") 'ido-switch-buffer)

;; exceute elisp or any code in future
(define-key global-map (kbd "C-e") 'eval-last-sexp)

;; close comand line
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; rgrep
(define-key global-map (kbd "M-g r") 'rgrep)

;;utils
(global-set-key (kbd "C-n") #'xah-new-empty-buffer)
(global-set-key (kbd "C-S-n") #'lunaryorn-new-buffer-frame)
(global-set-key (kbd "<f5>") 'bs-show)

(global-set-key (kbd "<f3>") (lambda () (interactive) (revert-buffer t t)))
