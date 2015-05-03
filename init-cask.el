;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Helper function required for initial configuration

(defun qnix/find-last (directory pattern)
  "Find the last file match the pattern in the given directory"
  (let* ((directory (file-truename directory))
         (find-command (concat "find " directory " -name " pattern)))
    (car (last (split-string (shell-command-to-string find-command) nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Cask configuration

(require 'cask (qnix/find-last
                (concat user-emacs-directory ".cask") "cask.el"))
(cask-initialize)
