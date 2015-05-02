
;;; Code:

;; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs/683575#683575
;;
;; Define a minor mode for all my "override" key bindings.  The key bindings in
;; this minor mode key-map will override the same key binding in major mode.
;; If you have bindings you want to work every where regardless of major mode
;; and you want an easy way to disable the override, the put them here.
;;
(defvar qnix/minor-mode-map (make-keymap) "qnix/minor-mode keymap.")

;; Dash
(define-key qnix/minor-mode-map (kbd "C-c d")   'dash-at-point)
(define-key qnix/minor-mode-map (kbd "C-c C-d") 'dash-at-point-with-docset)

(define-minor-mode qnix/minor-mode
  "A minor mode so that my key settings override major modes."
  t " qnix" 'qnix/minor-mode-map)
(qnix/minor-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Other global key bindings follow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "setup-helpers.el")

(defun qnix/global-set-key (binding function package)
  (global-set-key binding function)
  (autoload function package t nil))

;; Extra keybindings
(global-set-key (kbd "C-x M-s") 'save-buffer-always)
(global-set-key (kbd "C-x f")   'projectile-find-file)
(global-set-key (kbd "M-/")     'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s")     'isearch-forward-regexp)
(global-set-key (kbd "C-r")     'isearch-backward-regexp)
(global-set-key (kbd "C-M-s")   'isearch-forward)
(global-set-key (kbd "C-M-r")   'isearch-backward)
(global-set-key (kbd "C-S-k")   'kill-whole-line)
(global-set-key (kbd "M-g f")   'find-file-at-point)

;; Multi cursors
(qnix/global-set-key (kbd "C-c e l") 'mc/edit-lines              "multiple-cursors")
(qnix/global-set-key (kbd "M--")     'mc/mark-next-like-this     "multiple-cursors")
(qnix/global-set-key (kbd "M-+")     'mc/mark-previous-like-this "multiple-cursors")
(qnix/global-set-key (kbd "C-M-+")   'mc/mark-all-like-this      "multiple-cursors")

;; expand-region: (H is the right Alt key on my Mac keyboard)
(qnix/global-set-key (kbd "H-=")     'er/expand-region   "expand-region")
(qnix/global-set-key (kbd "H--")     'er/contract-region "expand-region")

;; Magit
(qnix/global-set-key (kbd "C-x g") 'magit-status "magit")

;; Ag
(qnix/global-set-key (kbd "C-x C-g") 'ag         "ag")
(qnix/global-set-key (kbd "C-x C-p") 'ag-project "ag")

;; Smex
(global-set-key (kbd "M-x")     'smex)
(global-set-key (kbd "C-x m")   'smex)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "M-X")     'smex-major-mode-commands)

;; Switch panel
(qnix/global-set-key (kbd "C-c w k") 'windmove-up    "windmove")
(qnix/global-set-key (kbd "C-c w j") 'windmove-down  "windmove")
(qnix/global-set-key (kbd "C-c w l") 'windmove-right "windmove")
(qnix/global-set-key (kbd "C-c w h") 'windmove-left  "windmove")


;; Split window
(global-set-key (kbd "C-c |") 'split-window-horizontally)
(global-set-key (kbd "C-c -") 'split-window-vertically)

;; Switch Frame
(global-set-key (kbd "s-]") 'other-frame)
(global-set-key (kbd "s-[") (lambda () (interactive) (other-frame -1)))
(global-set-key (kbd "s-}") 'other-window)
(global-set-key (kbd "s-{") (lambda () (interactive) (other-window -1)))

;; My custom binding
(global-set-key (kbd "C-c b c") 'qnix/byte-compile-current-buffer)
(global-set-key (kbd "C-c b d") 'qnix/delete-file-at-point)
(global-set-key (kbd "C-c b e") 'eval-buffer)
(global-set-key (kbd "C-c b f") 'qnix/find-library)
(global-set-key (kbd "C-c b o") 'qnix/switch-other-buffer)
(global-set-key (kbd "C-c b n") 'make-new-buffer)
(global-set-key (kbd "C-c b p") 'previous-buffer)
(global-set-key (kbd "C-c b R") 'qnix/cask-recompile)
(global-set-key (kbd "C-c b r") 'qnix/user-recompile)
(global-set-key (kbd "C-c b u") 'browse-url-at-point)
(global-set-key (kbd "C-c b U") 'browse-url)
(global-set-key (kbd "C-c b x") 'sudo-edit-current-file)
(global-set-key (kbd "C-c b q") 'make-new-dvorak-buffer)

(global-set-key (kbd "C-c b m") 'bookmark-set)
(global-set-key (kbd "C-c b j") 'bookmark-jump)
(global-set-key (kbd "C-c b l") 'bookmark-bmenu-list)

(global-set-key (kbd "C-c k")   'qnix/kill-current-buffer)
(global-set-key (kbd "C-c C-k") 'qnix/kill-current-buffer)
(global-set-key (kbd "C-c K")   'qnix/really-kill-current-buffer)

(global-set-key (kbd "M-n")     'next-error)
(global-set-key (kbd "M-p")     'previous-error)

(global-set-key (kbd "C-c C-=") 'text-scale-increase)
(global-set-key (kbd "s-=")     'text-scale-increase)
(global-set-key (kbd "C-c C--") 'text-scale-decrease)
(global-set-key (kbd "s--")     'text-scale-decrease)

;; I need this sometimes in terminal
(global-set-key (kbd "C-c q q") 'fill-paragraph)

(global-set-key (kbd "C-c q i") 'indent-sexp)
(global-set-key (kbd "C-c q s") 'indent-sexp)
(global-set-key (kbd "C-c q r") 'indent-region)

;; Note the C-c M- sequence can be entered as C-c C-[  -- really easy
(global-set-key (kbd "C-c M-f d") 'find-dired)
(global-set-key (kbd "C-c M-f l") 'qnix/find-library)
(global-set-key (kbd "C-c M-f n") 'qnix/create-new-file)

(global-set-key (kbd "C-x r e") 'eval-region)
(global-set-key (kbd "C-x r ;") 'comment-region)

;; Manually kill-emacs
(global-set-key (kbd "C-x C-k k")
                (lambda ()
                  (interactive)
                  (kill-emacs 1)))


;; C-c I : quickly open init.el
(defun qnix/edit-user-init-file ()
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))
(global-set-key (kbd "C-c I") 'qnix/edit-user-init-file)


(if (window-system)
    (global-set-key (kbd "C-;") 'iedit-mode)
  ;; to get around a problem the C-; binding does not work in terminal
  (global-set-key (kbd "C-c ;") 'iedit-mode))


(defun qnix/switch-to-scratch-buffer ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key (kbd "C-c b s") #'qnix/switch-to-scratch-buffer)


;; Scroll the other window up and down
(defun qnix/scroll-other-window-up ()
  (interactive)
  (scroll-other-window '-))


(global-set-key (kbd "C-c s d") 'scroll-other-window)
(global-set-key (kbd "C-c s u") 'qnix/scroll-other-window-up)
(global-set-key (kbd "C-c s v") 'qnix/scroll-other-window-up)


(provide 'setup-keys)

;;; setup-keys.el ends here
