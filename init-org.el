(defun daily-log-file-name ()
  "For daily log files, returns file name with today's date."
  (setq folderPath  (format "~/.emacs.d/org/%s"
			    (format-time-string "%Y/%m (%B)/"))
	fileName    (format "%s-%s-%s %s.org"
			    (format-time-string "%Y")
			    (format-time-string "%m")
			    (format-time-string "%d")
			    (format-time-string "%A")))
  (concat folderPath fileName))

(defun start-log ()
  "Creates a new org file with today's date for new tasks"
  (interactive)
  ;; TODO: Put in check and create new year / month folders if they don't exist.
  (setq fullFileName (funcall 'daily-log-file-name))
  (if (not (file-exists-p fullFileName))
      (write-region (format-time-string "%Y-%m-%d %A %T") nil fullFileName))
  (find-file fullFileName))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)") ;; general
	(sequence "ASSIGNED(a)" "FEEDBACK(f)" "|" "RESOLVED(r)") ;; work
	))

(defun check-for-clock-out-note()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (org-add-note)))
(add-hook 'org-clock-out-hook 'check-for-clock-out-note)

(provide 'init-org)
