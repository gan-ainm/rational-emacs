;;; custom-org.el --- Customized org settings based on crafted org  -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Gan Ainm

;; Author: Gan Ainm <gan.ainm.riomhphost@gmail.com>
;; Keywords: lisp, convenience 
;;
(require 'crafted-org-config)
(require 'org-roam)
(require 'org-present)
(require 'visual-fill-column)
(require 'org-faces)
(require 'org-superstar)

;;;
;;; org
;;;
(customize-set-variable 'org-directory (expand-file-name "~/org/"))
(customize-set-variable 'org-agenda-files
                        (expand-file-name "agenda.files" org-directory))
(customize-set-variable 'org-export-date-timestamp-format "%F")
(customize-set-variable 'org-hide-emphasis-markers t)
(customize-set-variable 'org-log-into-drawer t)
(customize-set-variable 'org-outline-path-complete-in-steps nil)
(customize-set-variable 'org-priority-faces (quote ((65 . "red"))))
(customize-set-variable 'org-refile-allow-creating-parent-nodes (quote confirm))
(customize-set-variable 'org-refile-targets (quote ((org-agenda-files :maxlevel . 6))))
(customize-set-variable 'org-refile-use-outline-path (quote file))
(customize-set-variable 'org-src-preserve-indentation nil)
(customize-set-variable 'org-ellipsis " ▼")
(customize-set-variable 'evil-auto-indent t)
(customize-set-variable 'org-tags-column -77)

(org-indent-mode 1)

(defvar jmf/fixed-width-font "JetBrains Mono"
  "The font used for monospaced text.")
(defvar jmf/variable-width-font "Iosevka Aile Thin"
  "The font used for document text.")

(defun jmf/org-set-faces ()
  ;; set faces for orgmode
  
  ;; Resize Org headings
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.0)
                  (org-level-6 . 1.0)
                  (org-level-7 . 1.0)
                  (org-level-8 . 1.0)))
    (set-face-attribute (car face) nil :font jmf/variable-width-font :weight 'medium :height (cdr face)))

  ;; Make the document title a bit bigger
  (set-face-attribute 'org-document-title nil :font jmf/variable-width-font :weight 'bold :height 1.3)
  ;;(set-face-attribute 'fixed-pitch nil :font jmf/fixed-width-font :weight 'light :height 100)
  ;;(set-face-attribute 'variable-pitch nil :font jmf/variable-width-font :weight 'light :height 1.0)

  ;; Make sure certain org faces use the fixed-pitch face when variable-pith-mode is on
  (set-face-attribute 'default nil :font jmf/fixed-width-font :weight 'light :height 100)
  (set-face-attribute 'fixed-pitch nil :font jmf/fixed-width-font :weight 'light :height 1.0)
  (set-face-attribute 'variable-pitch nil :font jmf/variable-width-font :weight 'light :height 1.0)
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

;; Configure fill width
(setq visual-fill-column-width 110
      visual-fill-column-center-text t)

(setq org-capture-templates
      (quote
       (("n" "Note" entry
         (file+headline "inbox.org" "NOTES")
         "* %^{Title}\n%?\n\n%a"
         :empty-lines 1)
        ("j" "Journal entry templates")
        ("jp" "Private journal" entry
         (file+olp+datetree "journal.org" "JOURNAL")
         "* %^{Title}\n[%<%R%z>]\n\n%?\n\n%a"
         :empty-lines 1)
        ("jw" "Work journal" entry
         (file+olp+datetree "work/journal.org")
         "* %^{Title}\n[%<%R%z>]\n\n%?\n\n%a"
         :empty-lines 1)
        ("t" "Todo" entry
         (file+headline "inbox.org" "TASKS")
         "* TODO %^{What?}\n%?\n\n%a"
         :empty-lines 1)
        ("c" "Daily todo checklist" checkitem
         (file+olp+datetree "daily.org")
         "[ ] %^{What?}\n%i\n\n%a"
         :empty-lines 1)
        ("b" "Book entry templates")
        ("bf" "Fiction" entry
         (file+olp "todo.org" "Reading" "Books" "Fiction")
         "* %^{Author}. %^{Title}%^{Publisher}p%^{Year}p%^{ISBN}p\n\n%?")
        ("bn" "Non-Fiction" entry
         (file+olp "todo.org" "Reading" "Books" "Non-Fiction")
         "* %^{Author}. %^{Title}%^{Publisher}p%^{Year}p%^{ISBN}p\n\n%?")
        ("x" "Web capture" entry
         (file+headline "inbox.org" "WEB captures")
         "* %:annotation\n\n%i\n%?\n%U"
         :empty-lines 1))))
;;;
;;; org-roam
;;;
(customize-set-variable 'org-roam-directory
                        (expand-file-name "org-roam/" org-directory))
(setq org-roam-templates
      '(("d" "default" plain
         "- tags ::\n\n* %?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)
        ("l" "programming language" plain
         "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("b" "book notes" plain (file "~/org/org-roam/templates/booknote.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Book")
         :unnarrowed t)
        ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
         :unnarrowed t))
      org-roam-capture-templates
      '(("d" "default" plain
         "- tags ::\n\n* %?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)
        ("l" "programming language" plain
         "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("b" "book notes" plain (file "~/org/org-roam/templates/booknote.org")
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Book")
         :unnarrowed t)
        ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
         :unnarrowed t))
      org-roam-capture-ref-templates
      '(("r" "ref" plain "%?" :target
         (file+head "${slug}.org" "#+title: ${title}\n\n%i\n\n")
         :unnarrowed t)))
      
;; If you're using a vertical completion framework, you might want a more inf;ormative completion interface
(when (or (bound-and-true-p fido-vertical-mode)
          (bound-and-true-p icomplete-vertical-mode)
          (bound-and-true-p vertico))
  (customize-set-variable 'org-roam-node-display-template
                          (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))))

;; Key mappings
(keymap-global-set "C-c a"    #'org-agenda)
(keymap-global-set "C-c x"    #'org-capture)
(keymap-global-set "C-c r l"  #'org-roam-buffer-toggle)
(keymap-global-set "C-c r f"  #'org-roam-node-find)
(keymap-global-set "C-c r g"  #'org-roam-graph)
(keymap-global-set "C-c r i"  #'org-roam-insert)
(keymap-global-set "C-c r c"  #'org-roam-capture)
; Dailies
(keymap-global-set "C-c r j"  #'org-roam-dailies-capture-today)

(org-roam-db-autosync-mode)

;; If using org-roam-protocol
;;(require 'org-roam-protocol)
  
;;;
;;; Org Present
;;;
(defun jmf/org-present-prepare-slide (buffer-name heading)
  ;; show only top-level headlines
  (org-overview)
  ;; unfold the current entry
  (org-fold-show-entry)
  ;; show only direct subheadings of the slide but don't expand them
  (org-fold-show-children))

(defun jmf/org-present-start ()
  ;; tweak font sizes
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                     (header-line (:height 4.0) variable-pitch)
                                     (org-document-title (:height 1.75) org-document-title)
                                     (org-code (:height 1.5) org-code)
                                     (org-verbatim (:height 1.5) org-verbatim)
                                     (org-block (:height 1.25) org-block)
                                     (org-block-begin-line (:height 0.7) org-block)))
  
  ;; set a blank header line string to create blank space at the top
  (setq header-line-format " ")

  ;; display inline images automatically
  (org-display-inline-images)

  (setq visual-fill-column-width 150
        visual-fill-column-center-text t)
  ;; center the presentation and wrap lines
  (visual-fill-column-mode 1)
  (visual-line-mode 1))

(defun jmf/org-present-end ()
  ;; reset font customizations
  (setq-local face-remapping-alist '((default variable-pitch default)))

  ;; clear the header line string so that it isn't displayed
  (setq header-line-format nil)

  ;; stop displaying inline images
  (org-remove-inline-images)

  ;; stop centering the document
  (visual-fill-column-mode 0)
  (visual-line-mode 0))

;; turn on variable pitch fonts in Org Mode buffers
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'jmf/org-set-faces)

;; register hooks with org-present
(add-hook 'org-present-mode-hook 'jmf/org-present-start)
(add-hook 'org-present-mode-quit-hook 'jmf/org-present-end)
(add-hook 'org-present-after-navigate-functions 'jmf/org-present-prepare-slide)

(provide 'custom-org-config)
