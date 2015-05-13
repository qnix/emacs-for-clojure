;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; OCaml programming environment configuration

;; path where opam executable is installed
(add-to-list 'exec-path "/usr/qta/local/bin")

(setq tuareg-display-buffer-on-eval nil)

(if (executable-find "opam")
    (progn

;;;; typerex, ocp-index, ocp-indent configuration

      (setq opam-bin
            (substring
             (shell-command-to-string "opam config var bin 2> /dev/null") 0 -1))

      (setq opam-share
            (substring
             (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))


      (add-to-list 'exec-path opam-bin)
      (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
      (require 'ocp-index)
      (require 'ocp-indent)

      (add-to-list 'load-path (concat opam-share "/tuareg"))
      (load "tuareg-site-file")

;;;; load typerex if it's installed.  currently having problem install it on 4.02
      (defvar ocp-edit-mode-bin "ocp-edit-mode")
      (if (executable-find ocp-edit-mode-bin)
          (with-temp-buffer
            (insert
             (shell-command-to-string (concat ocp-edit-mode-bin " emacs -load-global-config"))
             (eval-buffer))))

      (if (executable-find "utop")
          (progn
;;;; auto load utop.el
            (autoload 'utop "utop" "Toplevel for OCaml" t)

;;;; replace the default toplevel used by tuareg/typerex to utop
            (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
            (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
            (add-hook 'typerex-mode-hook 'utop-setup-ocaml-buffer)
            ))

;;;; merlin configuration
      (require 'merlin)

      ;; Start merlin on ocaml files
      (add-hook 'tuareg-mode-hook 'merlin-mode t)
      (add-hook 'caml-mode-hook 'merlin-mode t)

      ;; Enable auto-complete
      (setq merlin-use-auto-complete-mode 'easy)

      ;; Use opam switch to lookup ocamlmerlin binary
      (setq merlin-command 'opam)

      ;; Crashing constantly!!!
      ;; (with-eval-after-load 'merlin
      ;;   ;; Disable Merlin's own error checking
      ;;   (setq merlin-error-after-save nil)
      ;;   ;; Enable Flychecks checker
      ;;   (flycheck-ocaml-setup))

      ) ;; End of (if (executable-find "opam")
  (message "OCaml related modes are not configured."))


;;;; Add the OCaml manual info bundle
(add-to-list 'Info-default-directory-list (expand-file-name "~/info"))
(add-to-list 'Info-default-directory-list (expand-file-name "~/info/infoman"))

(add-hook 'Info-mode-hook               ; After Info-mode has started
          (lambda ()
            (setq Info-additional-directory-list Info-default-directory-list)
            ))


(provide 'setup-ocaml)
