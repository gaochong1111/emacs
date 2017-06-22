;; init keybidings

(global-set-key (kbd "<f2>") 'open-my-emacs-conf-file)

;; ivy mode
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; set org-agenda key
(global-set-key (kbd "C-c a") 'org-agenda)

;; set help key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; set recent file 
(global-set-key "\C-x\ \C-h" 'recentf-open-files)

(provide 'init-keybindings)


