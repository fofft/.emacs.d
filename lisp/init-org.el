(require 'init-local)
(require 'org)
(require 'org-install)
(require 'org-journal)

(add-to-list 'org-modules "org-habit")

(add-hook 'org-mode-hook 'flyspell-mode)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-journal-dir (concat local-dropbox-notes
			      (format-time-string "%Y/%m/")))

(setq org-journal-file-format "%Y%m%d.org")

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)") ;; general
	(sequence "ASSIGNED(a)" "|" "FEEDBACK(f)" "RESOLVED(r)" "RETURNED(e)") ;; work
	))

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

(setq org-hide-leading-stars t)

(setq org-agenda-include-diary t)

(setq org-log-done 'time)

(define-key org-mode-map "\M-q" 'toggle-truncate-lines)

(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files local-dropbox "\.org$"))

(defun check-for-clock-out-note()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (org-add-note)))

(add-hook 'org-clock-out-hook 'check-for-clock-out-note)

(setq org-agenda-custom-commands
      '(
	("a" "Agenda + TODO" (
	 (agenda "")
	 (tags-todo "-recommendations-goals-events")))
	("w" "Work" tags-todo "work")
	("u" "School" tags-todo "school")
	("d" "Daily" tags-todo "daily|weekly|monthly")
	("r" "Recommendations" tags-todo "recommendations")
	))

(setq org-agenda-start-day "+0d")
(setq org-agenda-span 11)
(setq org-agenda-start-on-weekday nil)

(provide 'init-org)
