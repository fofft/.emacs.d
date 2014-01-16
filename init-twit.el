(setq twit-dir "~/.emacs.d/elpa/twittering-mode-master")

(add-to-list 'load-path twit-dir)
(require 'twittering-mode)

(setq twittering-use-master-password t)
(setq twittering-timer-interval 900)

(add-hook 'twittering-edit-mode-hook (lambda () (ispell-minor-mode) (flyspell-mode)))

(provide 'init-twit)
