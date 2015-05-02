
;;; Code:


(defun qnix/config-haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation)
  (interactive-haskell-mode +1)
  (turn-off-evil-mode))

(add-hook 'haskell-mode-hook 'qnix/config-haskell-mode-hook)

(provide 'setup-haskell)

;;; setup-haskell.el ends here
