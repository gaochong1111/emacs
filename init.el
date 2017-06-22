 
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))



 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
;;		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages my/packages)
(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))
(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

; set theme monokai
(load-theme 'monokai 1)


;; set company mode
(add-hook 'after-init-hook 'global-company-mode)


;; set hungry-mode 
(require 'hungry-delete)
(global-hungry-delete-mode)
;; (hungry-delete-mode nil)
;; set ivy mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)


;; org mode
(require 'org)
(setq org-src-fontify-natively t)
;; set default Org Agenda file directory
(setq org-agenda-files '("~/orgs"))
;; set org-agenda key
(global-set-key (kbd "C-c a") 'org-agenda)


;; set js momde
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(require 'nodejs-repl)


;; set smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


;; set help key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "宋体" :foundry "outline" :slant normal :weight normal :height 139 :width normal)))))
;; reset the MarkSet key mapping
;(global-unset-key (kbd "C-SPC"))
;(global-set-key (kbd "M-SPC") `set-mark-command)
;;(global-set-key (kbd "C-SPC") 'set-mark-command)

; turn off bar and scroll 
(tool-bar-mode -1)
(scroll-bar-mode -1)
; turn off splash screen
(setq inhibit-splash-screen t)
; turn on the linum mode
(global-linum-mode t)
; set cursor type |
(setq-default cursor-type 'bar)
; turn off the backup 
(setq make-backup-files nil)
(setq auto-save-default nil)


(defun open-my-emacs-conf-file ()
  "open my emacs configuration file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-emacs-conf-file)


;set recent mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-h" 'recentf-open-files)


;; delete-selection-mode
(delete-selection-mode t)

;; full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; add-hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.2)
 '(company-minimum-prefix-length 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
