
;;; Code:

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t)

;; Bug fix
(setq debug-on-error t)
(setq stack-trace-on-error t)
(setq imenu-auto-rescan nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

;; Fix scrolling
(setq auto-window-vscroll nil)

;; Diable ring bell
(setq ring-bell-function 'ignore)

;; Remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(defvar dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq sentence-double-space t)
(setq require-final-newline t)

;; Make - part of word (treat the whole symbol as word)
(modify-syntax-entry ?- "w" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?- "w" lisp-mode-syntax-table)
(modify-syntax-entry ?- "w" lisp-interaction-mode-syntax-table)

;(require 'cl)
;(require 'ansi-color)

(require 'ffap)
;; (ffap-bindings)

(require 'recentf)
(recentf-mode +1)
(global-set-key (kbd "<f7>") #'recentf-open-files)

;; Prevent killing of certain buffer by filename regexp (default is *scratch*)
(if (fboundp 'unkillable-scratch) (unkillable-scratch 1))

;; git-gutter
(if (fboundp 'global-git-gutter) (global-git-gutter +1))

(provide 'sanity)

;;; sanity.el ends here
