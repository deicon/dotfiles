;; Org Mode Config
;; return opens heading in right buffer

(add-hook 'org-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map [S-return] (quote org-tree-open-in-right-frame))
            (define-key evil-normal-state-local-map [return] (quote org-tree-to-indirect-buffer)))
          )

;; enable plantuml files in org files
(setq org-plantuml-jar-path
      (expand-file-name "~/plantuml.jar"))
;; open exported files in correct files
'(org-file-apps
  (quote
   ((auto-mode . emacs)
    ("\\.mm\\'" . default)
    ("\\.x?html?\\'" . "/usr/bin/firefox %s")
    ("\\.pdf\\'" . default))))
(setq browse-url-generic-program
      (cond
       ((eq window-system 'mac) "open") ; mac
       ((or (eq system-type 'gnu/linux) (eq system-type 'linux)) ; linux
        (executable-find "firefox"))
       ))

;; auto update Browser for Markdown documents
  (defun my-flymd-browser-function (url)
    (let ((browse-url-browser-function 'browse-url-firefox))
      (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)



