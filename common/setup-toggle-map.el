;;;; Helper functions

;;
(defun qnix/toggle-indent-tabs-mode ()
  "Toggle indent tab mode"
  (interactive)
  (setq indent-tabs-mode (not indent-tabs-mode))
  (message (format "toggled indent-tabs-mode to %s" indent-tabs-mode))
  indent-tabs-mode)

(defvar *qnix/menu-bar-mode* 1)
(menu-bar-mode *qnix/menu-bar-mode*)

(defun qnix/toggle-menu-bar ()
  "Toggle the menu bar"
  (interactive)
  (setq *qnix/menu-bar-mode* (- *qnix/menu-bar-mode*))
  (if (> *qnix/menu-bar-mode* 0)
      (message "turn menu bar ON")
    (message "turn menu bar OFF"))
  (menu-bar-mode *qnix/menu-bar-mode*))

;; Toggle window dedication
(defun qnix/toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))

(defvar qnix/evil-esc-delay-default 0.5)

(defun qnix/toggle-evil-esc-delay ()
  "Toggle Evil esc mode."
  (interactive)
  (if (> evil-esc-delay 0)
      (setq evil-esc-delay 0)
    (setq evil-esc-delay qnix/evil-esc-delay-default))
  (message (format "evil-esc-delay: %s" evil-esc-delay)))


;;;; auto-async-byte-compile
(defun qnix/toggle-auto-async-byte-compile ()
  (interactive)
  (require 'auto-async-byte-compile)
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load my custom Dvorak input method
(load-file (concat user-emacs-directory "config/qnix-dvorak.el"))

;; This is my modified Dvorak layout
(defun qnix/toggle-dvorak-input-method ()
  (interactive)
  (if default-input-method
      (setq default-input-method "qnix-dvorak")
    (setq default-input-method nil))
  (activate-input-method default-input-method))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define-prefix-command 'endless/toggle-map)

;; The manual recommends C-c for user keys, but C-x t is
;; always free, whereas C-c t is used by some modes.
(define-key ctl-x-map "t" 'endless/toggle-map)

(define-key endless/toggle-map "a" #'qnix/toggle-auto-async-byte-compile)
(define-key endless/toggle-map "b" #'qnix/toggle-menu-bar)
(define-key endless/toggle-map "c" #'toggle-case-fold-search)
(define-key endless/toggle-map "d" #'toggle-debug-on-error)
(define-key endless/toggle-map "\C-d" #'qnix/toggle-evil-esc-delay)
(define-key endless/toggle-map "e" #'qnix/toggle-evil-esc-delay)
(define-key endless/toggle-map "f" #'auto-fill-mode)
(define-key endless/toggle-map "g" #'guide-key-mode)
(define-key endless/toggle-map "i" #'toggle-input-method)
(define-key endless/toggle-map "l" #'toggle-truncate-lines)
(define-key endless/toggle-map "m" #'toggle-frame-maximized)
(define-key endless/toggle-map "n" #'neotree-toggle)
(define-key endless/toggle-map "o" #'org-mode)
(define-key endless/toggle-map "u" #'text-mode)
(define-key endless/toggle-map "q" #'qnix/toggle-dvorak-input-method)
;; Generalized version of `read-only-mode'.
(define-key endless/toggle-map "r" #'dired-toggle-read-only)
(define-key endless/toggle-map "t" #'qnix/toggle-indent-tabs-mode)
(define-key endless/toggle-map "w" #'qnix/toggle-window-dedicated)
;(define-key endless/toggle-map "w" #'whitespace-mode)
(define-key endless/toggle-map "x" #'toggle-frame-fullscreen)

(autoload 'dired-toggle-read-only "dired" nil t)

(provide 'setup-toggle-map)

;;; setup-toggle-map.el ends here
