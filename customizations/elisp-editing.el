;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; some bindings for paredit-wrap
(define-key paredit-mode-map (kbd "C-c w [") 'paredit-wrap-square)
(define-key paredit-mode-map (kbd "C-c w (") 'paredit-wrap-round)
(define-key paredit-mode-map (kbd "C-c w {") 'paredit-wrap-curly)
(define-key paredit-mode-map (kbd "C-c w <") 'paredit-wrap-angled)
(define-key paredit-mode-map (kbd "C-c w e") 'paredit-wrap-sexp)
