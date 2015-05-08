
;;; Code:

(defun qnix/config-haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation)
  (interactive-haskell-mode +1)
  (turn-off-evil-mode))

(add-hook 'haskell-mode-hook 'qnix/config-haskell-mode-hook)


;; ghc-mod
;; ghc-mod is install via git repo, since we need to compile the Haskell side
;; of ghc-mod specifically. So make sure you do not install it via Cask.

(add-to-list 'load-path "/Users/qta/current-work/haskell/ghc-mod/elisp")

;; Put the following code to your "~/.emacs".
;;
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
;;
;; Or if you wish to display error each goto next/prev error,
;; set ghc-display-error valiable.
;;
;; (setq ghc-display-error 'minibuffer) ; to minibuffer
(setq ghc-display-error 'other-buffer) ; to other-buffer

(provide 'setup-haskell)
;;; setup-haskell.el ends here
