;; (setq debug-on-quit t)
;; (setq debug-on-error t)
;;;
;;; load custom file
;;;
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;;;
;;; load the standard crafted initialization
;;;
(load "~/.local/share/crafted-emacs/modules/crafted-init-config")

;;;
;;; load prepacked crafted packages
;;;
(require 'crafted-evil-packages)
(require 'crafted-completion-packages)
(require 'crafted-org-packages)
(require 'crafted-ui-packages)
(require 'crafted-workspaces-packages)
(require 'crafted-writing-packages)

;;;
;;; this is the personal choice of package selections
;;;
;; the ingenious Git frontend
(add-to-list 'package-selected-packages 'magit)
;; theming
(add-to-list 'package-selected-packages 'doom-themes)
(add-to-list 'package-selected-packages 'modus-themes)
(add-to-list 'package-selected-packages 'ef-themes)
;; dynamic completion aid for keychords
(add-to-list 'package-selected-packages 'which-key)
;; the Matrix client
(add-to-list 'package-selected-packages 'ement)
;; the virtual terminal
(add-to-list 'package-selected-packages 'vterm)
;; environment for Guile programming
(add-to-list 'package-selected-packages 'geiser)
(add-to-list 'package-selected-packages 'geiser-guile)
;; support for the Language Server Protocol
(add-to-list 'package-selected-packages 'lsp-mode)
;; environment for Rust programming
(add-to-list 'package-selected-packages 'rustic)
;; the butler for buffers
(add-to-list 'package-selected-packages 'bufler)
;; using PDFs with emacs
(add-to-list 'package-selected-packages 'pdf-tools)
;; some org enhancements
(add-to-list 'package-selected-packages 'org-modern)
(add-to-list 'package-selected-packages 'org-present)
(add-to-list 'package-selected-packages 'org-roam)

;;;
;;; install all selected packages
;;;
(package-install-selected-packages :noconfirm)

;;;
;;; version control
;;;
(require 'package-vc)

(add-to-list 'package-vc-selected-packages
  '(org-timeblock :url "https://github.com/ichernyshovvv/org-timeblock/"))

(package-vc-install-selected-packages)

;;;
;;; get all prepacked configurations
;;;
(require 'crafted-defaults-config)
(require 'crafted-evil-config)
(require 'crafted-completion-config)
(require 'custom-org-config)
(require 'crafted-ui-config)
(require 'crafted-workspaces-config)
(require 'crafted-writing-config)
(require 'crafted-updates-config)
(require 'crafted-startup-config)

(require 'magit)

;;;
;;; theming
;;;
;; (require 'doom-themes)
;; (load-theme 'doom-solarized-dark t)
;; (require 'modus-themes)
;; (load-theme 'modus-vivendi-tinted)
(load-theme 'ef-night)

;; activate which-key
(require 'which-key)
(which-key-mode 1)

(require 'ement)
(require 'vterm)

(keymap-set evil-normal-state-map "C-," 'embark-act)
(menu-bar-mode -1)
(tool-bar-mode -1)
;;;
;;; treesitter
;;;
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (rust "https://github.com/tree-sitter/tree-sitter-rust")))
;;;
;;; lsp-mode
;;;
;; change keybinding (s-l is used for i3wm to switch to window right)
(with-eval-after-load 'lsp-mode
  (keymap-set lsp-mode-map "s-m" lsp-command-map))

(with-eval-after-load "prog-mode"
  (keymap-set prog-mode-map "C-c e n" #'flymake-goto-next-error)
  (keymap-set prog-mode-map "C-c e p" #'flymake-goto-prev-error))

(add-hook 'prog-mode-hook #'menu-bar--display-line-numbers-mode-relative)
;;;
;;; python
;;;
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-hook 'python-ts-mode-hook #'eglot-ensure)
