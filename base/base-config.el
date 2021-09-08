;;; MELPA ;;;
;; To unlock the full potential of emacs we need to get some of that
;; good stuff out there on the internet. MELPA is our friend in this
;; quest.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and
  ;; MELPA Stable as desired
  (add-to-list 'package-archives
	       (cons "melpa" (concat proto "://melpa.org/packages/"))
	       t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto
  ;;"://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives
		 '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;; USE-PACKAGE ;;;
;; To keep track of all those wonderfull elisp programs MELPA provides
;; and their config, we turn to use-package that will automatically
;; install needed packages when for example using a new computer. But
;; how will automatically install use-package, this following code
;; will!
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
;; Install if not already installed.
(setq use-package-always-ensure t)


;; Dark theme
(load-theme 'wombat)
;; Best package, can not live without it
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;;Remove clutter
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(set-face-attribute 'default nil :height 140)
(setq-default indent-tabs-mode nil)


;;; --------------------COLUMN-MARKER------------------------------;;;
;; Visual aid to enfoce the holy 80 character width rule.
(use-package fill-column-indicator
  :config
  (add-hook 'prog-mode-hook 'fci-mode)
  (setq fci-rule-color "gray")
  )

;;; -------------------------MAGIT---------------------------------;;;
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))


;;; -------------------------VTERM--------------------------------;;;
(use-package vterm
  :config
  (setq vterm-shell "/usr/bin/fish"))

;;; ---------MARKDOWN-MODE------------------;;;
(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; ido mode magic to ignore *starred* folders with some exception
(setq my-unignored-buffers '("*terminal*" "*scratch*"))

(defun my-ido-ignore-func (name)
  "Ignore all non-user (a.k.a. *starred*) buffers except those listed in `my-unignored-buffers'."
  (and (string-match "\*$" name)
       (not (member name my-unignored-buffers))))

(setq ido-ignore-buffers '("\\` " my-ido-ignore-func))
;;; base-config.el ends here
