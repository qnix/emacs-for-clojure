
;;; Code:

(setq evil-want-fine-undo 'fine)
(setq evil-default-cursor t)
(setq evil-want-C-i-jump t)
(setq evil-want-C-w-delete t)
(setq evil-want-C-w-in-emacs-state t)
(setq evil-want-change-word-to-end t)
(setq evil-want-visual-char-semi-exclusive t)


(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)


;; These cursor settings only effect GUI Emacs
(setq evil-emacs-state-cursor    '("red" box))
(setq evil-normal-state-cursor   '("green" box))
(setq evil-visual-state-cursor   '("orange" box))
(setq evil-insert-state-cursor   '("blue" box))
(setq evil-replace-state-cursor  '("red" box))
(setq evil-operator-state-cursor '("red" hollow))


(require 'evil)
(evil-mode 1)

(unless (display-graphic-p)
  (evil-esc-mode +1))

(require 'undo-tree)
(global-undo-tree-mode)

;; Make hjkl keys work in special buffers
(evil-add-hjkl-bindings recentf-mode-map 'emacs)
(evil-add-hjkl-bindings bookmark-map 'emacs)


;; To get a reasonable delay to make it easy to enter binding that
;; contains Meta key, use toggle evil escape delay (C-x t e).  This
;; setting has no effect when in GUI, so set it to 0 initially to make
;; it easy to work with terminal.
(setq evil-esc-delay 0.75)

(define-key evil-insert-state-map "\C-g" 'evil-normal-state)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)

;; In evil-normal-state, C-w is prefix for window related commands
;; In evil-visual-state, C-w behaves similar to kill-region
;; In evil-insert-state, C-w evil-delete-backward-word set via
;; (setq evil-want-C-w-delete t)
(define-key evil-visual-state-map "\C-w" 'evil-delete)

;; Paste
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)

;; Cut
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)

(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)

;; Making the most of RET and SPC
;; It is common for Emacs modes like Buffer Menu, Ediff, and others to
;; define key bindings for RET and SPC. Since these are motion
;; commands, Evil places its key bindings for these in
;; evil-motion-state-map. However, these commands are fairly worthless
;; to a seasoned Vim user, since they do the same thing as j and l
;; commands. Thus it is useful to remove them from
;; evil-motion-state-map so as when modes define them, RET and SPC
;; bindings are available directly.
(defun qnix/my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))

(qnix/my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(qnix/my-move-key evil-motion-state-map evil-normal-state-map " ")

(define-key evil-ex-search-keymap "\C-r" 'evil-paste-from-register)

;; Search selected text
(define-key evil-visual-state-map "/" "y/\C-r\"\C-m")


(provide 'setup-evil)

;;; setup-evil.el ends here
