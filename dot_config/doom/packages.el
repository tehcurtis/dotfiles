;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Disable typescript-mode in favor of built-in tree-sitter modes
(package! typescript-mode :disable t)
(package! let-completion
  :recipe (:host github :repo "gggion/let-completion.el"))