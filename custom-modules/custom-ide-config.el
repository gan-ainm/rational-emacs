(require 'crafted-ide-config)
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
;;; Python
;;;
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-hook 'python-ts-mode-hook #'eglot-ensure)

;;;
;;; Rust
;;;
(setq rustic-lsp-client 'eglot)
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
(add-hook 'rust-ts-mode-hook #'eglot-ensure)
(add-hook 'eglot-managed-mode-hook (lambda() (flymake-mode -1)))

(provide 'custom-ide-config)
;;; crafted-ide-config.el ends here
