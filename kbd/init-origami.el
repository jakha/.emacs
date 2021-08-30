(define-prefix-command 'origami-mode-map)

;; (global-set-key (kbd "C-o") 'origami-mode-map)

(define-key origami-mode-map (kbd "C-o i") 'origami-close-all-nodes)

(define-key origami-mode-map (kbd "C-o k") 'origami-open-all-nodes)

(define-key origami-mode-map (kbd "C-o j") 'origami-close-node)

(define-key origami-mode-map (kbd "C-o l") 'origami-open-node-recursively)

