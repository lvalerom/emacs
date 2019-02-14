
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

;; go get golang.org/x/tools/cmd/...

;; install go-mode using melpa
;; M-x pacake-install go-mode

;; Update emacs path to find godoc
;; M-x package-install exec-path-from-shell

;; Restart emacs
;;
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/path/to/code")

(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; Install godef
;; go get github.com/rogpeppe/godef

;; verify M-x godef-jump go back M-*

(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; M-x package-install auto-complete
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

;; go-autocomplete
;; go get -u github.com/nsf/gocode
;; M-x pacakge-install go-autocomplete
(defun auto-complete-for-go ()
(auto-complete-mode 1))
 (add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;; go imports
;; go get golang.org/x/tools/cmd/goimport
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; go oracle
;; go get golang.org/x/tools/cmd/oracle
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Go oracle
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)
