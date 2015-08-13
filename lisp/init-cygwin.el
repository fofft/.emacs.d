(require 'init-local)

;; path to cygwin set here for diff especially 
(setenv "PATH" (concat (getenv "PATH") local-cygwin-bin)) 
(if (file-directory-p local-cygwin-bin) 
    (add-to-list 'exec-path local-cygwin-bin))
  ;; Sets your shell to use cygwin's bash, if Emacs finds it's running
  ;; under Windows and c:\cygwin64 exists. Assumes that C:\cygwin64\bin is
  ;; not already in your Windows Path (it generally should not be).
  ;;
  (let* ((cygwin-root local-cygwin-root)
         (cygwin-bin (concat cygwin-root "/bin")))
    (when (and (eq 'windows-nt system-type)
  	     (file-readable-p cygwin-root))
    
      (setq exec-path (cons cygwin-bin exec-path))
      (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
    
      ;; By default use the Windows HOME.
      ;; Otherwise, uncomment below to set a HOME
      ;;      (setenv "HOME" (concat cygwin-root "/home/eric"))
    
      ;; NT-emacs assumes a Windows shell. Change to bash.
      (setq shell-file-name "bash")
      (setenv "SHELL" shell-file-name) 
      (setq explicit-shell-file-name shell-file-name) 
    
      ;; This removes unsightly ^M characters that would otherwise
      ;; appear in the output of java applications.
      (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))

(provide 'init-cygwin)
