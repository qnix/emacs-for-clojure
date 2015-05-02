
(define-prefix-command 'launcher-map)
;;
;; C-x l is `count-lines-page' by default. If you
;; use that, you can try s-l or <C-return>.
(define-key ctl-x-map "l" 'launcher-map)
(global-set-key (kbd "s-l") 'launcher-map)

(define-key launcher-map "c" #'calc)
(define-key launcher-map "d" #'ediff-buffers)
(define-key launcher-map "f" #'find-dired)
(define-key launcher-map "g" #'lgrep)
(define-key launcher-map "G" #'rgrep)
(define-key launcher-map "h" #'man) ; Help
(define-key launcher-map "i" #'package-install-from-buffer)
(define-key launcher-map "n" #'elfeed-show-next)
(define-key launcher-map "p" #'paradox-list-packages)
(define-key launcher-map "s" #'shell)
(define-key launcher-map "t" #'proced) ; top

(provide 'setup-launcher-map)
