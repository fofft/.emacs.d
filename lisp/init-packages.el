(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(setq packages-used '(afternoon-theme
		      org
		      smex
		      batch-mode
		      twittering-mode
		      ))

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing.  Install it? " package))
	   (package-install package))))
 packages-used)

(provide 'init-packages)
