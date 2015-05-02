
;; Always save even when buffer is not modified
(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))


(defun make-new-buffer ()
  "Make a new buffer, uniquely named"
  (interactive)
  (switch-to-buffer "buf")
  ;; switch to lisp-interaction-mode for the new buffer
  (lisp-interaction-mode)
  (rename-uniquely))


(defun qnix/set-dvorak-input-method ()
  (interactive)
  (activate-input-method "qnix-dvorak")
  (setq default-input-method "qnix-dvorak"))

(defun make-new-dvorak-buffer ()
  "Make a new buffer with my custom dvorak input method."
  (interactive)
  (switch-to-buffer "qnix-dvorak")
  (rename-uniquely)
  (fundamental-mode)
  (qnix/set-dvorak-input-method))

(defun qnix/set-wydux-input-method ()
  (interactive)
  (activate-input-method "wydux")
  (setq default-input-method "wydux"))

(defun make-new-wydux-buffer ()
  "Make a new buffer with my custom wydux input method."
  (interactive)
  (switch-to-buffer "wydux")
  (rename-uniquely)
  (fundamental-mode)
  (qnix/set-wydux-input-method))

(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (untabify (point-min) (point-max)))


(defun qnix/cleanup-buffer ()
  "Perform a bunch of safe buffer operation on white spaces"
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))


;; Quickly switching to last buffer - binded to C-c b o
(defun qnix/switch-other-buffer ()
  "Quickly switching to last visited buffer."
  (interactive)
  (switch-to-buffer (other-buffer)))


(defun qnix/find-first-filename (directory pattern)
  "Find the first file match the pattern in the given directory"
  (let* ((directory (file-truename directory))
         (find-command (concat "/usr/bin/find " directory " -name " pattern)))
    (car (split-string (shell-command-to-string find-command) nil))))


(defun qnix/find-last-filename (directory pattern)
  "Find the first file match the pattern in the given directory"
  (let* ((directory (file-truename directory))
         (find-command (concat "/usr/bin/find " directory " -name " pattern)))
    (car (last (split-string (shell-command-to-string find-command) nil)))))


;; If you run into problem starting emacs after some Cask update with error on
;; package s- not found.  Just delete all the *.elc find under .emacs.d.
;; Note that if you are running multiple version of emacs, then you shouldn't
;; byte compile the *.el files under ~/.emacs.d as they are shared between
;; different version of Emacs.
(defun qnix/cask-recompile ()
  (interactive)
  (let ((cask-elpa-directory (concat user-emacs-directory ".cask/" emacs-version "/elpa/")))
    (byte-recompile-directory cask-elpa-directory 0 1)))


(defun qnix/user-recompile ()
  (interactive)
  (byte-recompile-directory (concat user-emacs-directory "common/") 0 1)
  (byte-recompile-directory (concat user-emacs-directory "config/") 0 1)
  (byte-recompile-directory (concat user-emacs-directory "elisp/") 0 1)
  (byte-recompile-directory (concat user-emacs-directory "modes/") 0 1)
  (load-file (concat user-emacs-directory "init.el")))


(defun qnix/find-library (fname)
  "View the source for library providing feature FNAME."
  (interactive
   (let ((lname (thing-at-point 'symbol))
         val)
     (setq val (completing-read (if lname
                                    (format "Find library (default %s): " lname)
                                  "Find library: ")
                                nil))
     (list (if (equal val "") lname val))))
  (let* ((lname (locate-library fname)))
    (cond ((string-match ".elc$" lname)
           (let ((sname (s-replace ".elc" ".el" lname)))
             (if (file-exists-p sname)
                 (find-file-read-only sname)
               (let ((sname (s-replace ".elc" ".el.gz" lname)))
                 (if (file-exists-p sname)
                     (find-file-read-only sname))))))
          (t
           (find-file-read-only lname)))))


;; Cut (C-w) or copy (M-w) current (line/word/list/string/etc) if nothing is selected
(defun next-list-boundaries ()
  (list (progn (paredit-forward) (point))
        (progn (paredit-backward) (point))))

(defun no-region-default-behavior ()
  (cond (mark-active
         (list (region-beginning) (region-end)))
        ((and (bolp) (not (equal "(" (char-to-string (char-after)))))
         (progn (message "Copy/cut line")
                (list (line-beginning-position) (line-beginning-position 2))))
        (t
         (progn (message "Copy/cut form")
                (next-list-boundaries)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (no-region-default-behavior)))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive (no-region-default-behavior)))


(defun qnix/kill-ring-save-line ()
  "Save the current line to the kill-ring."
  (interactive)
  (kill-ring-save
   (line-beginning-position)
   (line-beginning-position 2)))


(provide 'setup-helpers)
