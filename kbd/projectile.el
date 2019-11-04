;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-p") 'projectile-command-map)

;; projectile commandse
(define-key global-map (kbd "M-f") 'projectile-find-file)
(define-key global-map (kbd "M-d") 'projectile-find-dir)
(define-key global-map (kbd "M-p") 'projectile-switch-project)

(defcustom projectile-mode-line-prefix
  " <P>"
  "Mode line lighter prefix for Projectile.
It's used by `projectile-default-mode-line'
when using dynamic mode line lighter and is the only
thing shown in the mode line otherwise."
  :group 'projectile
  :type 'string
  :package-version '(projectile . "0.12.0"))
(defvar-local projectile--mode-line projectile-mode-line-prefix)
