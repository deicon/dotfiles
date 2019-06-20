
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(use-package zenburn-theme
  :ensure t)

(use-package anti-zenburn-theme
  :ensure t)

(use-package solarized-theme
  :ensure t)

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
           (recentf-mode)
          )
        )
    (projectile-mode +1)

(use-package neotree
  :ensure t 
  :bind (("<f8>" . neotree-toggle))
  )

(use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook 'org-bullets-mode)
)

(custom-set-variables
      '(org-directory "~/Dropbox/deicon/20. Orgfiles")
      '(org-default-notes-file (concat org-directory "/notes.org"))
      '(org-export-html-postamble nil)
      '(org-hide-leading-stars t)
      '(org-startup-folded (quote overview))
      '(org-startup-indented t)
      )

(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-files (list "~/Dropbox/Deicon/20. Orgfiles/schedule.org"
                             "~/Dropbox/Deicon/20. Orgfiles/ideas.org"
                             "~/Dropbox/Deicon/20. Orgfiles/links.org"))

(setq org-capture-templates
      '(
        ("t" "TODO" entry (file+headline "~/Dropbox/Deicon/20. Orgfiles/notes.org" "Neue Todos")
         "* TODO %?\n %i\n %a")
        ("l" "Link" entry (file+headline "~/Dropbox/Deicon/20. Orgfiles/links.org" "Neuer Link")
         "* %? %^L %^g \n%T" :prepend t)
        )
     ) 

(global-set-key "\C-cc" 'org-capture)

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

(global-set-key "\C-ce" 'recentf-open-files)

(global-set-key "\C-xb" 'ibuffer)

(show-paren-mode)

(use-package magit
    :ensure t
    )
(global-set-key (kbd "C-x g") 'magit-status)

(use-package lua-mode
            :ensure t
            :config
            (lua-mode))

(use-package plantuml-mode
    :ensure t
        )
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))

;; active Org-babel languages


(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

(setq org-plantuml-jar-path
      (expand-file-name "~/plantuml.jar")
      )

(use-package adoc-mode
:ensure t)
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))
