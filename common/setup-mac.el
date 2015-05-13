
;;; Code:

;; Command Keys
(setq mac-command-modifier 'super)
(setq mac-right-command-modifier 'meta)

;; Option Keys
(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier 'alt)

;; FN Keys and right Ctrl
(setq ns-function-modifier 'hyper)
(setq mac-right-control-modifier 'hyper)

(defvar normal-frame-alist
  `((font . "Monaco-18")
    (border-color . "lightskyblue1")
    (cursor-color . "brown")
    (width . 100) (height . 32)
    ;(left . 0) (top . 0)
    ))

(setq default-frame-alist
      (copy-alist normal-frame-alist))

(setq initial-frame-alist
      (copy-alist normal-frame-alist))

;; keybinding to toggle full screen mode
;; (global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
;; (add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

(provide 'setup-mac)
;;; setup-mac.el ends here
