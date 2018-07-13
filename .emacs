
(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;M-x package-list-package
;M-x package-install go-mode docker-compose-mode

(load "~/.emacs.d/highlight-chars.el")
(load "~/.emacs.d/column-marker.el")

;(load "~/.emacs.d/go-guru.el")
;(load "~/.emacs.d/go-mode.el")
;(load "~/.emacs.d/go-rename.el")

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
(add-hook 'go-mode-hook (lambda () 
                          (setq tab-width 2)
                          (setq indent-tabs-mode nil)
                          (interactive) (column-marker-3 80)))

;; hc-toggle-highlight-tabs
;; C-u column-marker-3
;; C-u C-u column-marker-3
;; C-u 80 column-marker-3

;;(setq-default indent-tabs-mode nil)

;;(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
;; M-x eval-buffers

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm
;;

(global-set-key (kbd "M-i") 'helm-swoop)

(require 'helm-config)
(with-eval-after-load "helm.el"
                      (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
;;

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet
;; yasnippet-snippets
(global-auto-complete-mode t)

(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autocomplete for c/c++
;; auto-complete-c-headers
(defun my:ac-c-headers-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list -achead:include-directories '"/usr/local/include")
  (add-to-list -achead:include-directories '"/usr/include")
  )

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iedit
;; fix-bug

(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cedet
;; 

(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-sources-semantic))

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; example project

(global-ede-mode 1)

(ede-cpp-root-project "my project" :file "~/tes.cpp"
                      :include-path '("~/"))

(global-semantic-idle-scheduler-mode 1)
