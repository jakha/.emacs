;;; package --- emacs
;;; Commentary:
;;; Code:

(require 'package)

(load "~/.emacs.d/utils.el")

;; add melpa package archive
(if (not (is-repo-added-to-package-archives "melpa"))
    (load "~/.emacs.d/add-melpa.el"))

;; install use package
(when (not (require 'use-package nil 'NOERROR))
  (load "~/.emacs.d/add-use-package.el"))

;; load independent from packages configs
(load "~/.emacs.d/base.conf/init-base-conf.el")

(unless (not package-archive-contents)
  (load "~/.emacs.d/base.conf/init-repository-packages.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "46f5e010e0118cc5aaea1749cc6a15be4dfce27c0a195a0dff40684e2381cf87" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "b574b0277f72c8e11ff2c92ef208070dbcfa89162424a912f564fc2272be23c7" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "b0e446b48d03c5053af28908168262c3e5335dcad3317215d9fdeb8bac5bacf9" "6f4421bf31387397f6710b6f6381c448d1a71944d9e9da4e0057b3fe5d6f2fad" "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "ff6c5a15591b98a58a7a68a969f7143e3e663991c31bf55ff0807f17e223af4b" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "e60d4fcb2484191f98a62017b6aae4dd12c676d13ba248f0f898b5bef32e9db4" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default))
 '(dap-auto-configure-features
   '(sessions locals breakpoints expressions repl controls tooltip))
 '(debug-on-error nil)
 '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
 '(flycheck-php-phpcs-executable "~/.emacs.d/languages/php/phpcbf/bin/phpcs")
 '(ignored-local-variable-values
   '((eval when
		   (and
			(buffer-file-name)
			(not
			 (file-directory-p
			  (buffer-file-name)))
			(string-match-p "^[^.]"
							(buffer-file-name)))
		   (unless
			   (featurep 'package-build)
			 (let
				 ((load-path
				   (cons "../package-build" load-path)))
			   (require 'package-build)))
		   (unless
			   (derived-mode-p 'emacs-lisp-mode)
			 (emacs-lisp-mode))
		   (package-build-minor-mode)
		   (setq-local flycheck-checkers nil)
		   (set
			(make-local-variable 'package-build-working-dir)
			(expand-file-name "../working/"))
		   (set
			(make-local-variable 'package-build-archive-dir)
			(expand-file-name "../packages/"))
		   (set
			(make-local-variable 'package-build-recipes-dir)
			default-directory))))
 '(lsp-completion-provider :none)
 '(package-selected-packages
   '(nord-theme ob-mongo mongo k8s-mode kubernetes kubernetes-helm lsp-sqls ivy-file-preview counsel-rg rg consult-company handlebars-sgml-mode psgml marginalia company-prescient selectrum-prescient quelpa-use-package quelpa vertico vertigo orderless consult-selectrum selectrum consult-lsp consult-projectile consult magit-delta diff-ansi multiple-cursors multi-line company-quickhelp-mode ejc-sql sql-indent elisp-refs lispy highlight-defined jedi-direx prolog-mode doom-modeline vs-dark-theme doom-themes vterm-toggle multi-vterm vterm company-terraform terraform-doc terraform-mode color-theme-buffer-local dockerfile-mode ripgrep lsp-origami company-capf company-yasnippet company-yasnipet yasnippet-snippets yasnippet company-lsp xterm-color grammarly erefactor protobuf-mode company-box which-key dap-golang dap-go ejson-mode origami lsp-lens dap-ui-mode treemacs jtags log4j-mode syslog-mode javascript-eslint exec-path-from-shell npm-mode js2-mode lsp-ivy yasnippet-go multi-compile go-scratch go-guru go-direx goscratch gotest go-rename go-eldoc flycheck-phpstan ac-php company-php magit phpcbf composer web-mode projectile diminish all-the-icons dashboard counsel swiper ivy php-project company-go lsp-go docker lsp-docker sublimity smooth-scrolling smartparens php-mode))
 '(selectrum-mode t)
 '(warning-suppress-log-types '((comp)))
 '(warning-suppress-types
   '((use-package)
	 (use-package)
	 (use-package)
	 (use-package)
	 (use-package)
	 (use-package)
	 (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package origami
  :ensure t)

(origami-mode)

;; other window
;; (define-key global-map (kbd "C-<right>") 'other-window)
;; (define-key global-map (kbd "C-<left>") 'back-window)

(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(load "~/.emacs.d/themes/doom.el")
(load-theme 'doom-nord-light)
(doom-modeline-mode)
(load (concat user-emacs-directory "kbd/init.el"))

(progn (global-set-key (kbd "M-<right>") 'other-window)
	   (global-set-key (kbd "M-<left>") 'back-window)
	   ;; (define-key  org-mode-map (kbd "M-<right>") 'other-window)
	   ;; (define-key	org-mode-map (kbd "M-<left>") 'back-window)
	   )

(put 'downcase-region 'disabled nil)
