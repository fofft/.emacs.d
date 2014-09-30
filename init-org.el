(add-hook 'org-mode-hook 'flyspell-mode)

(setq org-agenda-files (list local-dropbox))

(setq org-journal-dir (concat local-dropbox "/Notes/"))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)") ;; general
	(sequence "ASSIGNED(a)" "|" "FEEDBACK(f)" "RESOLVED(r)" "RETURNED(e)") ;; work
	))

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

(setq org-hide-leading-stars +1)

(setq org-agenda-include-diary t)

(defun check-for-clock-out-note()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (org-add-note)))
(add-hook 'org-clock-out-hook 'check-for-clock-out-note)

(defun todo()
  (interactive)
  (find-file (concat local-dropbox "/TODO.org")))

(defun todo-local()
  (interactive)
  (find-file (concat local-desktop "/TODO.org")))

(provide 'init-org)
