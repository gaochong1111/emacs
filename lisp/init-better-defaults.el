;; better default configuration

;; turn off the belling 
(setq ring-bell-function 'ignore)

; turn on the linum mode
(global-linum-mode t)

; turn off the backup 
(setq make-backup-files nil)
(setq auto-save-default nil)

;set recent mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; delete-selection-mode
(delete-selection-mode t)

;; add-hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; auto load the modified file on disk
(global-auto-revert-mode 1)

(provide 'init-better-defaults)
