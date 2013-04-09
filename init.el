(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; General settings.
(setq inhibit-startup-message +1)
(setq tool-bar-mode nil)
(setq visible-bell +1)
(global-linum-mode +1)
(global-hl-line-mode +1)
(electric-pair-mode +1)

;; Display time and date.
(setq display-time-day-and-date t)
(display-time)

;; See path in frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

;; Keep track of recently visited files
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode +1)

;; Highlight matching parentheses
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; Keep back ups to their own folder.
;; From StackOverflow (http://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs).
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
      backup-by-copying t   ; Don't delink hardlinks
      version-control t     ; Use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 20  ; how many of the newest versions to keep
      kept-old-versions 5   ; and how many of the old
)
  
(ido-mode +1)
