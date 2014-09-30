(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

(require 'init-packages)
(require 'init-local)
(require 'init-org)

;;smex settings
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; General settings.
(setq confirm-kill-emacs 'yes-or-no-p)
(setq inhibit-startup-message +1)
(setq tool-bar-mode nil)
(setq visible-bell +1)
(global-linum-mode +1)
(ido-mode +1)

;; setting aspell for ispell
(setq windows-ispell-dictionary "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe")
(if (file-exists-p windows-ispell-dictionary)
    (custom-set-variables
     '(ispell-dictionary "english")
     '(ispell-program-name windows-ispell-dictionary)))

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

;; Load theme
(load-theme 'afternoon)

(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))

;; Keep back ups to their own folder.
;; From StackOverflow (http://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs).
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
      backup-by-copying t   ; Don't delink hardlinks
      version-control t     ; Use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 20  ; how many of the newest versions to keep
      kept-old-versions 5   ; and how many of the old
)

(defvar timestamp-format "%Y-%m-%d %H:%M:%S")

(defun timestamp ()
  (interactive)
  (insert (format-time-string timestamp-format(current-time) "\n")
	  )
  (insert "\n")
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9f443833deb3412a34d2d2c912247349d4bd1b09e0f5eaba11a3ea7872892000" default)))
 '(ispell-dictionary "english")
 '(ispell-program-name windows-ispell-dictionary))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
