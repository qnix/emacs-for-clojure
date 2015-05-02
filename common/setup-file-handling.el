
(require 'thingatpt)

;; Fix an annoying problem where I can't create a new file with C-x C-f
;; If the file doesn't yet exist, emacs doesn't open an empty buffer with
;; the given filename.
(add-hook 'find-file-hooks 'qnix/assume-new-is-modified)

(defun qnix/assume-new-is-modified ()
  (when (not (file-exists-p (buffer-file-name)))
    (set-buffer-modified-p t)))


(defun qnix/really-kill-current-buffer ()
  "Kill the current buffer - even if modified."
  (interactive)
  (set-buffer-modified-p nil)
  (kill-buffer (current-buffer)))


(defun qnix/kill-current-buffer ()
  "Kill the current buffer if not modified."
  (interactive)
  (kill-buffer-if-not-modified (current-buffer)))


(defun qnix/byte-compile-current-buffer ()
  (interactive)
  (let ((file-name (buffer-file-name (current-buffer))))
    (if file-name
        (byte-compile-file file-name))))


(defun qnix/create-new-file (filename)
  "Create a file and open it in a buffer"
  (interactive "Ffilename to create: ")
  (if (file-exists-p filename)
      (progn
        (find-file filename)
        (message (format "file already exists: %s" filename)))
    (progn
      (with-temp-buffer (write-file filename))
      (find-file filename))))

;; To delete unwanted/untracked file in magit buffer
(defun qnix/delete-file-at-point ()
  (interactive)
  (let ((filename (thing-at-point 'filename))
        (current-pos (point)))
    (if (file-exists-p filename)
        (progn
          (delete-file filename)
          (magit-refresh)
          (goto-char current-pos)))))


(provide 'setup-file-handling)
