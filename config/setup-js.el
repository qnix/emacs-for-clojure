(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

(defun qnix/web-mode-hook ()
  "Hook for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t))

(add-hook 'web-mode-hook 'qnix/web-mode-hook)


;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(defun qnix/setup-js2-mode ()
  "Setup js2-mode."
  (interactive)
  (set-key js2-mode-map (kbd "C-c j d") 'ac-js2-jump-to-definition))

(add-hook 'js2-mode-hook 'qnix/setup-js2-mode)

(defun qnix/paredit-nonlisp ()
  "Turn on paredit-mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicate)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1)
  (define-key js2-mode-map "<" 'paredit-open-angle)
  (define-key js2-mode-map ">" 'paredit-close-angle)
  (define-key js2-mode-map "[" 'paredit-open-square)
  (define-key js2-mode-map "]" 'paredit-close-square)
  (define-key js2-mode-map "{" 'paredit-open-curly)
  (define-key js2-mode-map "}" 'paredit-close-curly-and-newline))

(add-hook 'js2-mode-hook 'qnix/paredit-nonlisp)


;; subword-mode
(add-hook 'js2-mode-hook  'subword-mode)
(add-hook 'css-mode-hook  'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)

;; skewer-mode
(add-hook 'js2-mode-hook  'skewer-mode)
(add-hook 'css-mode-hook  'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)
(js2r-add-keybindings-with-prefix "C-c C-m")

(setq js-indent-level 2)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


;; coffeescript
(add-to-list 'auto-mode-alist '("\\.coffee.erb$" . coffee-mode))
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook
          (defun coffee-mode-newline-and-indent ()
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
            (setq coffee-cleanup-whitespace nil)))


(custom-set-variables
 '(coffee-tab-width 2))
