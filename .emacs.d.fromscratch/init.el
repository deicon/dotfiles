;; Following lines load an Org file and build the configuration code out of it.

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


(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)    
    ))


(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
       (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  ))


(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)(add-hook 'after-init-hook 'global-company-mode)
  )

(use-package org-bullets
  :ensure t
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-bullet which-key use-package try org-plus-contrib org-bullets flycheck evil delight counsel company auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(org-babel-load-file (expand-file-name "~/.emacs.d/dotemacs.org"))
