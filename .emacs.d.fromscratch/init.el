;;; Commentary: Following lines load an Org file and build the configuration code out of it.

;;; Code:

(setq inhibit-startup-message t)


(require 'package)
(setq-default
   load-prefer-newer t
   package-enable-at-startup nil)

(setq package-archives
	     '(("melpa" . "https://melpa.org/packages/")
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
 '(package-selected-packages
   (quote
    (web-mode undo-tree org-bullet which-key use-package try org-plus-contrib org-bullets flycheck evil delight counsel company auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(org-babel-load-file (expand-file-name "~/.emacs.d/dotemacs.org"))
