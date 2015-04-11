;;;; full screen magit-status
(require 'magit)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(define-key magit-status-mode-map (kbd "n") 'magit-goto-next-section)
(define-key magit-status-mode-map (kbd "p") 'magit-goto-previous-section)

(global-set-key (kbd "C-x g") 'magit-status)

;;;{{{

;; Warning (:warning): for magit-1.4.0

;; You have just updated to version 1.4.0 of Magit, and have to
;; make a choice.

;; Before running Git, Magit by default reverts all unmodified
;; buffers which visit files tracked in the current repository.
;; This can potentially lead to dataloss so you might want to
;; disable this by adding the following line to your init file:

(setq magit-auto-revert-mode nil)

;; The risk is not as high as it might seem.  If snapshots on Melpa
;; and Melpa-Stable had this enabled for a long time, so if you did
;; not experience any dataloss in the past, then you should probably
;; keep this enabled.

;; Keeping this mode enabled is only problematic if you, for
;; example, use `git reset --hard REV' or `magit-reset-head-hard',
;; and expect Emacs to preserve the old state of some file in a
;; buffer.  If you turn of this mode then file-visiting buffers and
;; Magit buffer will no longer by in sync, which can be confusing
;; and complicates many operations.  Also note that it is possible
;; to undo a buffer revert using `C-x u' (`undo').

;; Then you also have to add the following line to your init file
;; to prevent this message from being shown again when you restart
;; Emacs:

(setq magit-last-seen-setup-instructions "1.4.0")

;; You might also want to read the release notes:
;; https://raw.githubusercontent.com/magit/magit/next/Documentation/RelNotes/1.4.0.txt

;;;}}}
