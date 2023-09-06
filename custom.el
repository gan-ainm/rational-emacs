;;; custom.el --- customization file                 -*- lexical-binding: t; -*-

;; Copyright (C) 2023  

;; Author:  <gan.ainm.riomhphost@gmail.com>
;; Keywords: 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace t)
 '(Man-notify-method 'aggressive t)
 '(TeX-auto-save t)
 '(TeX-electric-math '("$" . "$"))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-parse-self t)
 '(auctex-latexmk-inherit-TeX-PDF-mode t)
 '(bookmark-save-flag 1)
 '(byte-compile-warnings '(redefine unresolved obsolete))
 '(completion-category-overrides '((file (styles partial-completion))))
 '(completion-cycle-threshold 3)
 '(completion-styles '(orderless basic))
 '(completions-detailed t)
 '(corfu-auto t)
 '(corfu-auto-delay 0.0)
 '(corfu-auto-prefix 2)
 '(corfu-cycle t)
 '(corfu-echo-documentation 0.25 t)
 '(custom-safe-themes
   '("636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" default))
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain t)
 '(eshell-scroll-to-bottom-on-input 'this t)
 '(evil-respect-visual-line-mode t)
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-h-delete t)
 '(evil-want-C-i-jump nil)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(fast-but-imprecise-scrolling t)
 '(global-auto-revert-non-file-buffers t)
 '(ibuffer-movement-cycle nil t)
 '(ibuffer-old-time 24 t)
 '(kill-do-not-save-duplicates t)
 '(load-prefer-newer t t)
 '(magit-save-repository-buffers 'dontask)
 '(marginalia-annotators
   '(marginalia-annotators-heavy marginalia-annotators-light nil) t)
 '(markdown-enable-html t)
 '(markdown-enable-math t)
 '(org-hide-emphasis-markers t)
 '(org-link-descriptive t)
 '(org-mouse-1-follows-link t)
 '(org-return-follows-link t)
 '(package-archive-priorities
   '(("gnu" . 99)
     ("nongnu" . 80)
     ("stable" . 70)
     ("melpa" . 0)))
 '(package-selected-packages
   '(org-timeblock org-ql vterm ement which-key doom-themes magit auctex-latexmk auctex pandoc-mode markdown-mode tabspaces helpful elisp-demos all-the-icons org-appear denote vertico orderless marginalia embark-consult embark corfu-terminal corfu consult cape evil-nerd-commenter evil-collection evil compat))
 '(package-vc-selected-packages
   '((org-timeblock :url "https://github.com/ichernyshovvv/org-timeblock/")))
 '(reftex-plug-into-AUCTeX t t)
 '(scroll-conservatively 101)
 '(scroll-margin 0)
 '(scroll-preserve-screen-position t)
 '(switch-to-buffer-in-dedicated-window 'pop)
 '(switch-to-buffer-obey-display-actions t)
 '(tab-always-indent 'complete)
 '(tabspaces-include-buffers '("*scratch*"))
 '(tabspaces-mode t)
 '(tabspaces-remove-to-default t)
 '(tabspaces-use-filtered-buffers-as-default t)
 '(vertico-cycle t)
 '(xref-show-definitions-function 'xref-show-definitions-completing-read t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
