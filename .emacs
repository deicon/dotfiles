
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

 (defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'iedit 'magit 'neotree 'projectile 'evil-mode
			  )

(setq package-enable-at-startup nil)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(neo-window-position (quote left))
 '(org-todo-keywords (quote ((sequence "TODO" "STARTED" "STOPPED" "DONE"))))
 '(package-selected-packages (quote (evil-mode evi-mode neotree ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ORG MODE EXTENSION FOR TIME CLOCKING
(eval-after-load 'org
  '(progn
     (defun wicked/org-clock-in-if-starting ()
       "Clock in when the task is marked STARTED."
       (when (and (string= state "STARTED")
		  (not (string= org-last-state org-state)))
	 (org-clock-in)))
     (add-hook 'org-after-todo-state-change-hook
	       'wicked/org-clock-in-if-starting)
     (defadvice org-clock-in (after wicked activate)
      "Set this task's status to 'STARTED'."
      (org-todo "STARTED"))
    (defun wicked/org-clock-out-if-waiting ()
      "Clock out when the task is marked WAITING."
      (when (and (string= org-state "STOPPED")
                 (equal (marker-buffer org-clock-marker) (current-buffer))
                 (< (point) org-clock-marker)
	         (> (save-excursion (outline-next-heading) (point))
		    org-clock-marker)
		 (not (string= org-last-state org-state)))
	(org-clock-out)))
    (add-hook 'org-after-todo-state-change-hook
	      'wicked/org-clock-out-if-waiting)))

(require 'evil)
(evil-mode t)
