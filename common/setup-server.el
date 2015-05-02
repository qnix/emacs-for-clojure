
;;; Code:

(require 'server)

(unless (server-running-p)
  (server-start)
  ;; only the instance that starts the server do persistent scratch
  (message ">>>> start persistent scratch")
  (load (concat user-common-directory "setup-persistent-scratch")))

(provide 'setup-server)

;;; setup-server.el ends here
