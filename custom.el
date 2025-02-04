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
   '("4d4475c85408bbc9d71e692dd05d55c6b753d64847f5e364d1ebec78d43e2aef" "277a5bce12d6957dbabb43a2f55ee2b6371388b749cbb29fd251df19334a1f0b" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" default))
 '(dired-auto-revert-buffer t)
 '(dired-dwim-target t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain t)
 '(eglot-autoshutdown t t)
 '(eshell-scroll-to-bottom-on-input 'this t)
 '(evil-auto-indent t)
 '(evil-respect-visual-line-mode t)
 '(evil-undo-system 'undo-redo)
 '(evil-want-C-h-delete t)
 '(evil-want-C-i-jump nil)
 '(evil-want-integration t)
 '(evil-want-keybinding nil)
 '(fancy-splash-image
   "/home/jmf/.local/share/crafted-emacs/system-crafters-logo.png")
 '(fast-but-imprecise-scrolling t)
 '(global-auto-revert-non-file-buffers t)
 '(ibuffer-movement-cycle nil)
 '(ibuffer-old-time 24)
 '(kill-do-not-save-duplicates t)
 '(load-prefer-newer t t)
 '(magit-save-repository-buffers 'dontask)
 '(major-mode-remap-alist
   '((python-mode . python-ts-mode)
     (bash-mode . bash-ts-mode)))
 '(marginalia-annotators
   '(marginalia-annotators-heavy marginalia-annotators-light nil) t)
 '(markdown-enable-html t)
 '(markdown-enable-math t)
 '(org-agenda-custom-commands
   '(("p" "Planning"
      ((tags-todo "+@planning"
                  ((org-agenda-overriding-header "Planning Tasks")))
       (tags-todo "-{.*}"
                  ((org-agenda-overriding-header "Untagged Tasks")))
       (todo ".*"
             ((org-agenda-files
               '("~/org/inbox.org"))
              (org-agenda-overriding-header "Unprocessed Inbox Items")))))
     ("d" "Daily Agenda"
      ((agenda ""
               ((org-agenda-span 'day)))))))
 '(org-agenda-files "/home/jmf/org/agenda.files")
 '(org-babel-load-languages
   '((shell . t)
     (emacs-lisp . t)
     (C . t)
     (python . t)
     (awk . t)))
 '(org-capture-templates
   '(("n" "Note" entry
      (file+headline "inbox.org" "NOTES")
      "* %^{Title}\12%?\12\12%a" :empty-lines 1)
     ("j" "Journal entry templates")
     ("jp" "Private journal" entry
      (file+olp+datetree "journal.org" "JOURNAL")
      "* %^{Title}\12[%<%R%z>]\12\12%?\12\12%a" :empty-lines 1)
     ("jw" "Work journal" entry
      (file+olp+datetree "work/journal.org")
      "* %^{Title}\12[%<%R%z>]\12\12%?\12\12%a" :empty-lines 1)
     ("t" "Todo" entry
      (file+headline "inbox.org" "TASKS")
      "* TODO %^{What?}\12%?\12\12%a" :empty-lines 1)
     ("c" "Daily todo checklist" checkitem
      (file+olp+datetree "daily.org")
      "[ ] %^{What?}\12%i\12\12%a" :empty-lines 1)
     ("b" "Book entry templates")
     ("bf" "Fiction" entry
      (file+olp "todo.org" "Reading" "Books" "Fiction")
      "* %^{Author}. %^{Title}%^{Publisher}p%^{Year}p%^{ISBN}p\12\12%?")
     ("bn" "Non-Fiction" entry
      (file+olp "todo.org" "Reading" "Books" "Non-Fiction")
      "* %^{Author}. %^{Title}%^{Publisher}p%^{Year}p%^{ISBN}p\12\12%?")
     ("x" "Web capture" entry
      (file+headline "inbox.org" "WEB captures")
      "* %:annotation\12\12%i\12%?\12%U" :empty-lines 1)))
 '(org-directory "/home/jmf/org/")
 '(org-ellipsis " ▼")
 '(org-export-date-timestamp-format "%F" t)
 '(org-hide-emphasis-markers t)
 '(org-link-descriptive t)
 '(org-log-into-drawer t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m ol-git-link))
 '(org-mouse-1-follows-link t)
 '(org-outline-path-complete-in-steps nil)
 '(org-priority-faces '((65 . "red")))
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :maxlevel . 6)))
 '(org-refile-use-outline-path 'file)
 '(org-return-follows-link t)
 '(org-roam-capture-ref-templates
   '(("r" "ref" plain "%?" :target
      (file+head "${slug}.org" "#+title: ${title}\12\12%i\12\12")
      :unnarrowed t)))
 '(org-roam-capture-templates
   '(("d" "default" plain "- tags ::\12\12* %?" :if-new
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12#+date: %U\12")
      :unnarrowed t)
     ("l" "programming language" plain "* Characteristics\12\12- Family: %?\12- Inspired by: \12\12* Reference:\12\12" :if-new
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12")
      :unnarrowed t)
     ("b" "book notes" plain
      (file "~/org/org-roam/templates/booknote.org")
      :if-new
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12#+filetags: Book")
      :unnarrowed t)
     ("v" "video notes" plain
      (file "~/org/org-roam/templates/videonote.org")
      :if-new
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
      :unnarrowed t)
     ("p" "project" plain "* Goals\12\12%?\12\12* Tasks\12\12** TODO Add initial tasks\12\12* Dates\12\12" :if-new
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12#+filetags: Project")
      :unnarrowed t)))
 '(org-roam-directory "/home/jmf/org/org-roam/")
 '(org-src-preserve-indentation nil)
 '(org-tags-column -77)
 '(package-archive-priorities
   '(("gnu" . 99)
     ("nongnu" . 80)
     ("stable" . 70)
     ("melpa" . 0)))
 '(package-selected-packages
   '(evil-org org-roam emacsql-sqlite-builtin org-present org-modern pdf-tools bufler rustic lsp-mode geiser-guile geiser ef-themes modus-themes breadcrumb org-timeblock org-ql vterm ement which-key doom-themes magit auctex-latexmk auctex pandoc-mode markdown-mode tabspaces helpful elisp-demos all-the-icons org-appear denote vertico orderless marginalia embark-consult embark corfu-terminal corfu consult cape evil-nerd-commenter evil-collection evil compat))
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
