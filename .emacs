(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(load "~/.emacs.d/highlight-chars.el")
(load "~/.emacs.d/column-marker.el")

;(load "~/.emacs.d/go-guru.el")
;(load "~/.emacs.d/go-mode.el")
;(load "~/.emacs.d/go-rename.el")

(setq-default indent-tabs-mode nil)

(hc-toggle-highlight-tabs)
;;(column-marker-1)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'awk-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'html-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'js-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'nxml-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'css-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'json-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'java-mode-hook (lambda () (interactive) (column-marker-3 80)))
(add-hook 'sh-mode-hook (lambda () (interactive) (column-marker-3 80)))

;; hc-toggle-highlight-tabs
;; C-u column-marker-3
;; C-u C-u column-marker-3
;; C-u 80 column-marker-3

;;(setq-default indent-tabs-mode nil)

;;(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
