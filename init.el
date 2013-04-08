(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; General settings.
(setq inhibit-startup-message t)
(setq tool-bar-mode nil)
(setq visible-bell t)
(global-linum-mode t)

;; Display time and date.
(setq display-time-day-and-date t)
(display-time)

;; Keep back ups to their own folder.
;; From StackOverflow (http://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs).
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
  backup-by-copying t   ; Don't delink hardlinks
  version-control t     ; Use version numbers on backups
  delete-old-versions t ; Automatically delete excess backups
  kept-new-versions 20  ; how many of the newest versions to keep
  kept-old-versions 5   ; and how many of the old
  )
  
(ido-mode t)
