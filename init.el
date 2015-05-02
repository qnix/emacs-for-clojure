
;; Set the user-emacs-directory if this is not the default emacs config
(setq user-emacs-directory (expand-file-name "~/clj-emacs/"))
(add-to-list 'load-path user-emacs-directory)
(load "init-cask.el")

;; I am sick and tired of 'package! Always mess up at the wrong moment.
;; Use Cask! once the package is installed, it's there until I fancy
;; another update/upgrade.
(add-to-list 'load-path (concat user-emacs-directory "common"))
(load "setup-evil.el")
(load "sanity.el")
(load "compatibility.el")

(load "setup-backup.el")
(load "setup-file-handling.el")
(load "setup-helpers.el")
(load "setup-keys.el")
(load "setup-toggle-map.el")
(load "setup-launcher-map.el")

(load "setup-magit.el")
(load "setup-helm.el")
(load "setup-org-mode.el")

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path (concat user-emacs-directory "config"))

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

;; For editing lisps
(load "elisp-editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-ocaml.el")
(load "setup-haskell.el")
