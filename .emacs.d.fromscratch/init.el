;;; Commentary: Following lines load an Org file and build the configuration code out of it.

;;; Code:

(setq inhibit-startup-message t)


(require 'package)
(setq-default
   load-prefer-newer t
   package-enable-at-startup nil)

(setq package-archives
	     '(("melpa" . "https://melpa.milkbox.net/packages/")
	       '("org"  . "https://orgmode.org/elpa/")
	       	     ))

(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))

(add-to-list 'load-path "~/.emacs.d/evil")
    (require 'evil)
    (evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" default)))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/deicon/20. Orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (plantuml-mode anti-zenburn-theme solarized-theme zenburn-theme neotree treemacs treemacs-projectile magit web-mode undo-tree org-bullet which-key use-package try org-plus-contrib org-bullets flycheck evil delight counsel company auto-complete)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(org-babel-load-file (expand-file-name "~/.emacs.d/dotemacs.org"))
