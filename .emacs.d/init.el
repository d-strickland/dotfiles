;;; init.el --- emacs settings
;;; Commentary:
;;; My Emacs settings
;;; Code:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
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

(use-package solarized-theme
  :ensure t
  :config
  (set-face-attribute 'region nil :background "#002b36" :foreground "#fdf6e3")
  (load-theme 'solarized-dark t))
;; (use-package zenburn-theme
;;   :ensure t
;;   :config (load-theme 'zenburn t))


(use-package helm
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;;; (use-package ycmd
;;;   :ensure t
;;;   :config
;;;   (setq ycmd-server-command
;;;         (list "python" "/Users/david/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
;;;   (global-ycmd-mode))
;;; (use-package company-ycmd
;;;   :ensure t
;;;   :config
;;;   (company-ycmd-setup))
;;; 
;;; (use-package flycheck-ycmd
;;;   :ensure t
;;;   :config
;;;   (flycheck-ycmd-setup))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package kotlin-mode
  :ensure t)

(use-package elm-mode
  :ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-python-command "/usr/local/bin/python3"))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package markdown-mode
  :ensure t)

;; Turn off useless GUI shit
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

;; Misc. Settings
(show-paren-mode 1)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(global-linum-mode t)
(when (member "Menlo" (font-family-list)) (set-frame-font "Menlo-13" t t))
(setq-default vc-follow-symlinks t)
(setq-default undo-tree-auto-save-history t)

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
    (elm-mode flymd markdown-mode zenburn-theme intero color-theme-solarized evil-magit elpy kotlin-mode magit evil-surround flycheck-ycmd company-ycmd auto-complete flycheck helm solarized-theme use-package evil-visual-mark-mode evil-escape)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(region ((t (:foreground "#fdf6e3" :background "#002b36")))))

(provide 'init)
;;; init.el ends here
