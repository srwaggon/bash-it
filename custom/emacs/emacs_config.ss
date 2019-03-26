;; Long live spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; configure backup directory
(setq backup-directory-alist
    `(("." . ,(concat user-emacs-directory "backups"))))

;; loading/creating a file/buffer whose name ends with '.ss'
;; automagically switches Emacs to Scheme mode.
(setq auto-mode-alist
      (append
       '(("\\.scm$" . scheme-mode)
         ("\\.ss$"  . scheme-mode))
       auto-mode-alist))

;; teach Emacs to properly indent certain special forms
(put 'cond 'scheme-indent-function 0)
(put 'library 'scheme-indent-function 1)
(put 'match 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)


(transient-mark-mode t)
(show-paren-mode 1)


;; turn on colors
;; Note: to change colors use: M-x customize-apropos-faces RET font-lock RET
(set-background-color "Black")
(set-foreground-color "White")
(set-face-foreground 'font-lock-comment-face "Red")
(set-cursor-color "LightSkyBlue")
(set-mouse-color "LightSkyBlue")
(require 'font-lock)
(setq font-lock-maximum-decoration 't)
(global-font-lock-mode 't)


;;
(require 'whitespace)
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)


;; set number of spaces for indentation
(setq sh-basic-offset 2)
(setq sh-indentation 2)
(setq c-basic-offset 2)
(setq js-indent-level 2)

;; just spaces, no tabs, when indenting
(setq-default indent-tabs-mode nil)

;; show line number in status bar
(line-number-mode 1)

;; show column number in status bar
(column-number-mode 1)

;; display time in staus bar
(display-time)

;; makes the cursor stay in the same place when you page up or down
(setq scroll-preserve-screen-position t)

;; typing on an active region removes it
(cond
  ((fboundp 'turn-on-pending-delete)
   (turn-on-pending-delete))
  ((fboundp 'pending-delete-on)
   (pending-delete-on t)))

;; get rid of the "this file does not end in newline" atrocity
(add-hook 'after-init-hook '(lambda () (setq require-final-newline nil)))

;; enable mouse support
(xterm-mouse-mode 1)
(mouse-wheel-mode t)

;; show a menu only when running within X (save real estate when
;; in console)
(menu-bar-mode (if window-system 1 -1))

;; C/C++ indentation
(c-set-offset 'case-label '+)

;; M-g is by default a useless set-face command.
(global-set-key "\M-g" 'goto-line)

(put 'narrow-to-region 'disabled nil)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-variables
 '(column-number-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(save-place nil nil (saveplace))
 '(show-paren-mode t))

;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
 (custom-set-faces)

(put 'upcase-region 'disabled nil)

;; Save place in file between sessions
(require 'saveplace)
(setq save-place t)
(if (fboundp #'save-place-mode)
  (save-place-mode +1)
  (setq-default save-place t))
