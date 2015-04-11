
;; Set the user-emacs-directory if this is not the default emacs config
(setq user-emacs-directory (expand-file-name "~/clj-emacs/"))

;; I am sick and tired of 'package! Always mess up at the wrong moment.
;; Use Cask! once the package is installed, it's there until I fancy
;; another update/upgrade.
(add-to-list 'load-path (concat user-emacs-directory "common"))
(load "setup-cask.el")
(load "setup-evil.el")
(load "setup-helm.el")
(load "setup-magit.el")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path (concat user-emacs-directory "customizations"))

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-ocaml.el")
