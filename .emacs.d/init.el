;; init.el --- emacs settings
;;; Commentary:
;;; My Emacs settings
;;; Code:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Load and configure evil
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-shift-width 2)
  (setq evil-want-C-u-scroll t)
  (setq evil-ex-search-highlight-all nil)
  :config ;; tweak evil after loading it

  ;; Keymaps
  (define-key evil-normal-state-map "," my-leader-map)

  (define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-line-to-center)
  (define-key evil-normal-state-map (kbd "-") 'dired)

  (eval-when-compile
    (defvar my-leader-map (make-sparse-keymap)
      "Keymap for \"leader key\" shortcuts."))

  (define-key my-leader-map "j" 'evil-window-down)
  (define-key my-leader-map "k" 'evil-window-up)
  (define-key my-leader-map "h" 'evil-window-left)
  (define-key my-leader-map "l" 'evil-window-right)
  (define-key my-leader-map ";" 'maximize-window)
  (define-key my-leader-map "t" 'ansi-term)

  (define-key my-leader-map "e" '(lambda() (interactive) (find-file user-init-file)))
  (define-key my-leader-map "s" 'eval-buffer)
  (define-key my-leader-map "S" '(lambda() (interactive) (progn (save-buffer) (eval-buffer) (previous-buffer))))
  (define-key my-leader-map (kbd "g s") 'magit-status)
  (define-key my-leader-map (kbd "g b") 'magit-branch)

  (defun paste-next-line ()
    "Paste text from the kill ring onto the next line."
    (interactive)
    (end-of-line)
    (newline-and-indent)
    (evil-paste-after 1))
  (define-key my-leader-map "p" 'paste-next-line)

  (define-key my-leader-map "f" 'flycheck-next-error)
  (define-key my-leader-map "F" 'flycheck-previous-error)

  (evil-mode))

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "kj")
  (setq-default evil-escape-unordered-key-sequence t))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package solarized-theme
  :ensure t
  :config
  (set-face-attribute 'region nil :background "#eee8d5" :foreground "#002b36")
  (load-theme 'solarized-dark t))

(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  'helm-mode)

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (add-to-list 'company-backends 'company-elm)
  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-elm-setup))

(use-package ispell
  :ensure t)

(use-package flyspell
  :ensure t)

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package kotlin-mode
  :ensure t)

(use-package haskell-mode
  :ensure t)

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

(use-package elm-mode
  :ensure t
  :init

  ;; for elm-0.19
  (setq elm-package-json "elm.json")

  (defun init-elm-mode ()
    (add-to-list 'company-backends 'company-elm)
    (elm-format-on-save-mode))

  (add-hook 'elm-mode-hook 'init-elm-mode)

  ;; needs to be at top-level https://github.com/jcollard/elm-mode/issues/129#issuecomment-346974494
  (with-eval-after-load 'elm-mode
    (remove-hook 'elm-mode-hook 'elm-indent-mode)))

(use-package flycheck-elm
  :ensure t)

(use-package groovy-mode
  :ensure t)

(use-package powershell
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-python-command "python3"))

(use-package markdown-mode
  :ensure t)

(use-package recentf
  :ensure t
  :config
  (recentf-mode 1)
  (setq-default recentf-max-menu-items 25)
  (setq-default recentf-max-saved-items 25))

;; Turn off useless GUI shit
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

;; Misc. Settings
(show-paren-mode 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-linum-mode 0 )
(setq-default linum-format "%4d\u2502")
(when (member "Meslo" (font-family-list)) (set-frame-font "Meslo LG M DZ" t t))
(setq-default vc-follow-symlinks t)
(setq-default undo-tree-auto-save-history t)
(setq-default dired-hide-details-mode 1)
(setq-default dired-listing-switches "-l")
(setq-default dired-omit-files "^\\.?#\\|^\\..*^")

(savehist-mode 1)
(define-key dired-mode-map "-" 'dired-up-directory)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (flycheck-elm dante evil-org yaml-mode elm-mode flymd markdown-mode zenburn-theme intero color-theme-solarized evil-magit elpy kotlin-mode magit evil-surround flycheck-ycmd company-ycmd auto-complete flycheck helm solarized-theme use-package evil-visual-mark-mode evil-escape)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 160 :width normal))))
 '(region ((t (:background "#eee8d5" :foreground "#002b36")))))

(provide 'init)
;;; init.el ends here
