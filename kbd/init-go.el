
(define-key go-mode-map (kbd "<f10>") 'ide-run-last-build)

(define-key go-mode-map (kbd "<S-f10>") 'ide-debug-last-build)

(define-key go-mode-map (kbd "<f9>") 'goja-build-transient)

(define-key go-mode-map (kbd "C-j g") 'goja-get-package)

(define-key go-mode-map (kbd "<f6>") 'goja-mod-vendor)

(define-key go-mode-map (kbd "<f7>") 'go-test-current-test)

(define-key go-mode-map (kbd "<f8>") 'go-test-current-test-cache)
