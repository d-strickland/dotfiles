;; linux.el --- Linux specific emacs settings
;;; Commentary:
;;; My Emacs settings
;;; Code:


(add-to-list 'default-frame-alist '(width  . 90))
(add-to-list 'default-frame-alist '(height . 160))
(add-to-list 'default-frame-alist '(font . "Monospace-14"))

(require 'server)
(unless (server-running-p) (server-start))

;;; linux.el ends here
