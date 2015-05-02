
;;; Code:

(defvar persistent-scratch-filename
    "~/.emacs-persistent-scratch"
    "Location of *scratch* file contents for persistent-scratch.")

(defvar persistent-scratch-backup-directory
    "~/.emacs-persistent-scratch-backups/"
    "Location of backups of the *scratch* buffer contents for persistent-scratch.")

(defun make-persistent-scratch-backup-name ()
  "Create a filename to backup the current scratch file by
  concatenating PERSISTENT-SCRATCH-BACKUP-DIRECTORY with the
  current date and time."
  (concat
   persistent-scratch-backup-directory
   (replace-regexp-in-string
    (regexp-quote " ") "-" (current-time-string))))

(defun save-persistent-scratch ()
  "Write the contents of *scratch* to the file name
  PERSISTENT-SCRATCH-FILENAME, making a backup copy in
  PERSISTENT-SCRATCH-BACKUP-DIRECTORY."
  (interactive)
  (with-current-buffer (get-buffer "*scratch*")
    (if (file-exists-p persistent-scratch-filename)
        (copy-file persistent-scratch-filename
                   (make-persistent-scratch-backup-name)))
    (write-region (point-min) (point-max)
                  persistent-scratch-filename)
    (set-buffer-modified-p nil)))

(defun load-persistent-scratch ()
  "Load the contents of PERSISTENT-SCRATCH-FILENAME into the
  scratch buffer, clearing its contents first."
  (interactive)
  (if (file-exists-p persistent-scratch-filename)
      (with-current-buffer (get-buffer "*scratch*")
        (delete-region (point-min) (point-max))
        (shell-command (format "cat %s" persistent-scratch-filename) (current-buffer)))))

;; Load the previous scratch content when we start up
(load-persistent-scratch)

;; And save the scratch buffer's content when we exit Emacs.
(push #'save-persistent-scratch kill-emacs-hook)

;; For manually save the current scratch buffer (which is in
;; lisp-interactive-mode by default)
(define-key lisp-interaction-mode-map (kbd "C-c s s") 'save-persistent-scratch)
(define-key lisp-interaction-mode-map (kbd "C-c s l") 'load-persistent-scratch)


(provide 'setup-persistent-scratch)

;;; setup-persistent-scratch.el ends here
