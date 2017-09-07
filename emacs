
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(show-paren-mode t)
(transient-mark-mode t)
(fset 'yes-or-no-p'y-or-n-p)
(display-time)
(setq server-use-tcp t
      server-port 9999)
(require 'server)
(defun server-start-and-copy ()
  "start server and copy auth files"
  (when (and (fboundp 'server-running-p)   ;function exists.
	     (not (server-running-p)))
    (server-start)                          ;emacs as server mode
    (when (file-exists-p "/qishanqing@qsq:~/")
      (delete-file "/qishanqing@qsq:~/"))
    (copy-file "~/.emacs.d/server/server" "/qishanqing/@qsq:~/")
    ))
(add-hook 'emacs-startup-hook' server-start-and-copy)
(add-hook 'find-file-hooks 'flymake-find-file-hook)

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/plugins/popup-el")
(add-to-list 'load-path "~/.emacs.d/plugins/pos-tip")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
(setq ac-dwim t)
;;(setq ac-auto-start nil)              ;auto complete using clang is CPU sensitive
;;(ac-set-trigger-key "<C-return>")
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
(setq ac-fuzzy-enable t)

;; menu设置为12 lines
(setq ac-menu-height 12)

;; 高亮光标的当前行
(global-hl-line-mode 1)

;; 设置默认换行模式为“在窗口边缘自动换行”
(toggle-truncate-lines t)

;; 设置tab space
(setq tab-width 4)

(dolist (hook '(
		eshell-mode-hook
		help-mode-hook
		magit-mode-hook
		dired-mode-hook
		vc-mode-line-hook
		diff-mode-hook
		))
  (add-hook hook (lambda () (my-buffer-face-mode))))
(defun my-buffer-face-mode()
  (buffer-face-mode)
  (make-local-variable 'line-spacing)
  (setq line-spacing 4)
  )

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'green-phosphor t) 
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-comidia)

(setq org-startup-indented t)
(setq org-src-fontify-natively t)

;;git-emacs集成
;;(add-to-list 'load-path "~/.emacs.d/plugins/git-emacs")
;;(require 'git-emacs)
