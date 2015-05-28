(require 'init-local)
(require 'org)
(require 'org-install)
(add-to-list 'org-modules "org-habit")

(add-hook 'org-mode-hook 'flyspell-mode)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)") ;; general
	(sequence "ASSIGNED(a)" "|" "FEEDBACK(f)" "RESOLVED(r)" "RETURNED(e)") ;; work
	))

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

(setq org-hide-leading-stars t)

(setq org-agenda-include-diary t)

(setq org-log-done 'time)

(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files local-dropbox "\.org$"))

(defun check-for-clock-out-note()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (org-add-note)))
(add-hook 'org-clock-out-hook 'check-for-clock-out-note)

(setq org-agenda-custom-commands
      '(("w" "Work" tags-todo "work")))

(setq org-agenda-custom-commands
      '(("u" "School" tags-todo "school")))

(provide 'init-org)
