;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Helper function required for initial configuration

(defun qnix/find-last (directory pattern)
  "Find the last file match the pattern in the given directory"
  (let* ((directory (file-truename directory))
         (find-command (concat "/usr/bin/find " directory " -name " pattern)))
    (car (last (split-string (shell-command-to-string find-command) nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Cask configuration

(require 'cask (qnix/find-last
                (concat user-emacs-directory ".cask") "cask.el"))
(cask-initialize)

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
  (exec-path-from-shell-initialize))
