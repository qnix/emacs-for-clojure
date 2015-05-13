(require 'twittering-mode)

;; Details here:
;; http://emacswiki.org/emacs/TwitteringMode

(twittering-enable-unread-status-notifier)
(setq twittering-use-master-password t)

(add-hook 'twittering-mode-hook
          (lambda ()
            (setq twittering-timer-interval 300)
            (setq twittering-url-show-status nil)
            (setq twittering-icon-mode nil)
            (setq twittering-status-format "%i %s\n%FILL[ ]{%T}\n %FACE[glyphless-char]{%@ from %f%L%r%R}\n")
            (set-face-attribute 'twittering-username-face nil
                                :underline nil
                                :weight 'bold
                                :foreground "darksalmon")

            ))

(add-hook 'twittering-edit-mode-hook
          (lambda ()
            (auto-fill-mode -1)
            (visual-line-mode)
            (ispell-minor-mode)
            (flyspell-mode)))

(provide 'setup-twitter)
