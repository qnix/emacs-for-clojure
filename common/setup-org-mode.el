
;;; Code:

(require 'org)

(require 'ob-sh)
(require 'ob-R)
(require 'ob-ocaml)
(require 'ob-python)
(require 'ob-ruby)
(require 'ob-clojure)
(require 'ob-emacs-lisp)
(require 'ob-lisp)

(load "pabbrev" (expand-file-name "~/.emacs.d/config/pabbrev.el"))

;(require 'pabbrev)

(defun qnix/setup-text-mode ()
  (flyspell-mode 1)
  (auto-fill-mode 1)
  (set-fill-column 78)
  (pabbrev-mode 1)
  )

(add-hook 'text-mode-hook 'qnix/setup-text-mode)
(add-hook 'org-mode-hook  'qnix/setup-text-mode)

;; Keep everything in on big org file.
(defvar org-gtd-file (concat org-directory "/gtd.org"))

;; I open my gtd file when I hit C-c g
(defun gtd ()
  "Open the GTD file."
  (interactive)
  (find-file org-gtd-file))

;; Where to store captured notes.
(setq org-default-notes-file (concat org-directory "/notes.org"))


;; Org-mode key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cg" 'gtd)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-c\C-t" 'org-todo)


;; Setup deft mode to use with org-mode
(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory (concat org-directory "/deft"))
(setq deft-use-filename-as-title t)
(setq deft-auto-save-interval 15.0)


(global-set-key [f8] 'deft)


(defun endless/round-quotes (italicize)
  "Insert “” and leave point in the middle.
With prefix argument ITALICIZE, insert /“”/ instead (meant for org-mode).
If inside a code-block, simply calls `self-insert-command'."
  (interactive "P")
  (if (and (derived-mode-p 'org-mode) (org-in-src-block-p))
      (call-interactively 'self-insert-command)
    (if (looking-at "”[/=_\\*]?")
        (goto-char (match-end 0))
      (when italicize
        (insert "//")
        (forward-char -1))
      (insert "“”")
      (forward-char -1))))

;(define-key org-mode-map "\"" #'endless/round-quotes)


;; Define this extra binding to use in terminal mode until I can
;; figure out why it's nto working in terminal mode, but work fine in
;; GUI.  I suspect it has something to do with evil-mode config.
(define-key org-mode-map (kbd "C-c o") 'org-cycle)


;; remember
(require 'remember)
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(global-set-key (kbd "C-c C-r") 'remember)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ocaml . t)
   (python . t)
   (ruby . t)
   (emacs-lisp . t)
   (lisp . t)
   ;(lua . t)
   ))

;; I should setup this with Yasnippet
(defun qnix/insert-ocaml-block ()
  (interactive)
  (insert
"
#+name: OCaml-code
#+begin_src ocaml

#+end_src\n"))

(defun qnix/insert-R-block ()
  (interactive)
  (insert "
#+name: R-code
#+begin_src R

#+end_src\n"))

(defun qnix/insert-src-block (language)
  (interactive "slanguage: ")
  (insert (format "
#+name: give-me-a-name
#+begin_src %s

#+end_src\n" language)))

(define-key org-mode-map (kbd "C-c s o") 'qnix/insert-ocaml-block)
(define-key org-mode-map (kbd "C-c s r") 'qnix/insert-R-block)
(define-key org-mode-map (kbd "C-c s i") 'qnix/insert-src-block)


(provide 'setup-org-mode)

;;; setup-org-mode.el ends here
