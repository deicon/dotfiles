
(use-package flycheck
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook #'global-flycheck-mode)
    )
  )

(use-package projectile
    :ensure t
    :config
    (progn
       (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
       (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
       (define-key projectile-mode-map (kbd "M-n") 'projectile-find-file)
      )
    )
(projectile-mode +1)

(use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook 'org-bullets-mode)
)

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

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

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  )
(setq web-mode-enable-auto-closing t)

(use-package helm-projectile
  :ensure t
  )
