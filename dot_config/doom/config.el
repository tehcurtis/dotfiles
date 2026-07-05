;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Set user-full-name and user-mail-address in personal.el

;;; UI
(setq doom-theme 'doom-city-lights)
(setq display-line-numbers-type 'relative)

;;; Formatting
(setq +format-on-save-disabled-modes
      '(sql-mode tex-mode latex-mode org-msg-edit-mode))

;;; Org
(setq org-directory "~/org/")


;;; :tools magit
(setq magit-repository-directories '(("~/projects" . 2))
      magit-save-repository-buffers nil
      transient-values '((magit-rebase "--autosquash" "--autostash")
                        ;; (magit-pull "--rebase" "--autostash")
                         (magit-revert "--autostash")))

(after! org
  (setq org-startup-folded 'show2levels
        org-ellipsis " [...] "
        ;; My org/org-roam capture templates
        org-capture-templates
        '(("t" "todo" entry (file+headline "todo.org" "Unsorted")
           "* [ ] %?\n%i\n%a"
           :prepend t)
          ("d" "deadline" entry (file+headline "todo.org" "Schedule")
           "* [ ] %?\nDEADLINE: <%(org-read-date)>\n\n%i\n%a"
           :prepend t)
          ("s" "schedule" entry (file+headline "todo.org" "Schedule")
           "* [ ] %?\nSCHEDULED: <%(org-read-date)>\n\n%i\n%a"
           :prepend t)
          ("c" "check out later" entry (file+headline "todo.org" "Check out later")
           "* [ ] %?\n%i\n%a"
           :prepend t)
          ("l" "ledger" plain (file "ledger.gpg")
           "%(+beancount/clone-transaction)"))))

;;; Workspaces
(after! persp-mode
  (setq persp-auto-resume-time -1  ; don't auto-resume
        persp-auto-save-opt 0))    ; don't auto-save

;; Start with a clean single-window layout
(add-hook! 'doom-init-ui-hook
  (delete-other-windows))

;;; TypeScript/TSX (tree-sitter)
(use-package! typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :config
  (add-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook) #'lsp!))

;; Load personal config (not tracked in git)
(load! "personal.el" nil t)
