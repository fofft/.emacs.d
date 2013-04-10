(defun start-log ()
  (interactive)
  (setq folderPath  (format "~/.emacs.d/org/%s"
			    (format-time-string "%Y/%m (%B)/"))
	fileName    (format "%s-%s-%s %s.org"
			 (format-time-string "%Y")
			 (format-time-string "%m")
			 (format-time-string "%d")
			 (format-time-string "%A")))
  (setq fullFileName (concat folderPath fileName))
  ;; TODO: Put in check and create new year / month folders if they don't exist.
  (if (not (file-exists-p fullFileName))
      (write-region (format-time-string "%Y-%m-%d %A %T") nil fullFileName))

  (find-file fullFileName))

(provide 'init-org)
