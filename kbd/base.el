;; buffer split and close
(define-key global-map (kbd "M-1") 'delete-other-windows)
(define-key global-map (kbd "M-2") 'split-window-right)
(define-key global-map (kbd "M-3") 'split-window-below)
(define-key global-map (kbd "M-0") 'delete-window)

;; save
(define-key global-map (kbd "M-s") 'save-buffer)
(define-key global-map (kbd "C-k") 'kill-buffer)

;; cut and paste to alt kbd
(define-key global-map (kbd "M-q") 'kill-region)
(define-key global-map (kbd "M-e") 'yank)
(define-key global-map (kbd "C-a") 'mark-whole-buffer)

;; switch buffer, file and project ido mode
(define-key global-map (kbd "M-b") 'ido-switch-buffer)

;; swiper
(define-key global-map (kbd "C-s") 'swiper)

;;counsel
(define-key global-map (kbd "C-f") 'counsel-find-file)


;; close comand line
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; other window
(define-key global-map (kbd "M-p") 'other-window)
(define-key global-map (kbd "M-o") 'back-window)
(defun back-window ()
  (interactive)
  (other-window -1))