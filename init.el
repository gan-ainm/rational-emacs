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
(require 'custom-org-packages)
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
;; restclient
(add-to-list 'package-selected-packages 'restclient)
(add-to-list 'package-selected-packages 'restclient-jq)
(add-to-list 'package-selected-packages 'ob-restclient)
;; activities
(add-to-list 'package-selected-packages 'activities)
;; dired-preview
(add-to-list 'package-selected-packages 'dired-preview)

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
(require 'crafted-org-config)
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
(use-package doom-themes
  :init
  (load-theme 'doom-one :no-confirm)
;; (load-theme 'doom-solarized-dark t)
;; (require 'modus-themes)
;; (load-theme 'modus-vivendi-tinted)
;;(load-theme 'ef-night)
  (unless crafted-startup-inhibit-splash
    (setq initial-buffer-choice #'crafted-startup-screen)))

;; activate which-key
(use-package which-key
  :init
  (which-key-mode 1))

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
;;;
;;; activities
;;;
(use-package activities
  :init
  (activities-mode 1)
  (activities-tabs-mode 1)
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)
  :bind
  (("C-x C-a C-n" . activities-new)
   ("C-x C-a C-d" . activities-define)
   ("C-x C-a C-a" . activities-resume)
   ("C-x C-a C-s" . activities-suspend)
   ("C-x C-a C-k" . activities-kill)
   ("C-x C-a RET" . activities-switch)
   ("C-x C-a b"   . activities-switch-buffer)
   ("C-x C-a g"   . activities-revert)
   ("C-x C-a l"   . activities-list)))

;;;
;;; mu4e & e-mail
;;;
(setq send-mail-function 'smtpmail-send-it
      user-full-name "Gan Ainm"
      user-mail-address "gan.ainm.riomhphost@gmail.com"
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" "587" nil nil))
      smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server "smtp.gmx.com"
      starttls-extra-arguments nil
      starttls-gnutls-program "/usr/bin/gnutls-cli"
      starttls-extra-arguments nil
      starttls-use-gnutls t)

(use-package mu4e
  ;; :ensure nil
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "/usr/bin/mbsync -a -c ~/.config/mbsync/config")
  (setq mu4e-maildir "~/.local/share/Mail")
  (setq mu4e-sent-folder "/GMX/Sent")
  (setq mu4e-drafts-folder  "/GMX/Drafts")
  (setq mu4e-refile-folder  "/GMX/Archives")
  (setq mu4e-trash-folder  "/GMX/Trash")
  (setq mu4e-user-mailing-lists
        '((:list-id "dev.suckless.org"                               :name "suckless-dev")
          (:list-id "wiki.suckless.org"                              :name "suckless-wiki")
          (:list-id "1UOWK3I-11SY9YM.newsletterversand.zeit.de"      :name "ZEIT")
          (:list-id "git-for-windows.googlegroups.com"               :name "git-windows")
          (:list-id "newsletter.news.outdooractive.com.0sgsk-2s4.mj" :name "Outdooractive")
          (:list-id "news.lists.systemcrafters.net"                  :name "SystemCrafters")
          (:list-id "learningtoplayvim.buttondown.email"             :name "LearnPlayVim")
          (:list-id "SystemCrafters/crafted-emacs"                   :name "crafted-emacs")))
  (setq mu4e-headers-fields
        '((:human-date . 12)
          (:flags . 6)
          (:from-or-to . 25)
          (:mailing-list . 20)
          (:subject)))
  (add-hook 'mu4e-compose-pre-hook
            (defun jmf/thunderbird-reply()
              "Set quoting style to Thunderbird-like"
              (setq message-cite-style message-cite-style-thunderbird)))

  (setq mu4e-contexts
        (list
         (make-mu4e-context
          :name "Personal"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/GMX" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "jens@netfelderhoff.com")
                  (user-full-name . "Jens Felderhoff")
                  (smtpmail-smtp-server . "smtp.gmx.net")
                  (smtpmail-smtp-service . 587)
                  (smtpmail-debug-info . t)
                  (mu4e-drafts-folder . "/GMX/Drafts")
                  (mu4e-sent-folder . "/GMX/Sent")
                  (mu4e-refile-folder . "/GMX/Archives")
                  (mu4e-trash-folder . "/GMX/Trash")
                  (mu4e-maildir-shortcuts . ((:maildir "/GMX/Inbox"     :key ?i)
                                             (:maildir "/GMX/Sent"      :key ?s)
                                             (:maildir "/GMX/Trash"     :key ?t)
                                             (:maildir "/GMX/Drafts"    :key ?d)
                                             (:maildir "/GMX/Archives"  :key ?a)))))
         (make-mu4e-context
          :name "Gan"
          :match-func
          (lambda (msg)
            (when msg
              (string-prefix-p "/Gmail" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address . "gan.ainm.riomhphost@gmail.com")
                  (user-full-name . "Gan Ainm")
                  (smtpmail-smtp-server . "smtp.gmail.com")
                  (smtpmail-smtp-service . 587)
                  (smtpmail-debug-info . t)
                  (mu4e-drafts-folder . "/Gmail/[Google Mail]/Drafts")
                  (mu4e-sent-folder . "/Gmail/[Google Mail]/Sent Mail")
                  (mu4e-refile-folder . "/Gmail/[Google Mail]/All Mail")
                  (mu4e-trash-folder . "/Gmail/[Google Mail]/Trash")
                  (mu4e-maildir-shortcuts . ((:maildir "/Gmail/Inbox"   :key ?i)
                                             (:maildir "/Gmail/[Google Mail]/Sent"      :key ?s)
                                             (:maildir "/Gmail/[Google Mail]/Trash"     :key ?t)
                                             (:maildir "/Gmail/[Google Mail]/Drafts"    :key ?d)))))))

  (setq mu4e-maildir-shortcuts
        '((:maildir "/GMX/Inbox"     :key ?i)
          (:maildir "/GMX/Sent"      :key ?s)
          (:maildir "/GMX/Trash"     :key ?t)
          (:maildir "/GMX/Drafts"    :key ?d)
          (:maildir "/GMX/Archives"  :key ?a))))
;;;
;;; dired-preview
;;;
(require 'dired-preview)

;; Default values for demo purposes
(setq dired-preview-delay 0.7)
(setq dired-preview-max-size (expt 2 20))
(setq dired-preview-ignored-extensions-regexp
        (concat "\\."
                "\\(gz\\|"
                "zst\\|"
                "tar\\|"
                "xz\\|"
                "rar\\|"
                "zip\\|"
                "iso\\|"
                "epub"
                "\\)"))

;; Enable `dired-preview-mode' in a given Dired buffer or do it
;; globally:
(dired-preview-global-mode 1)

;;;
;;; Magit
;;;

;; handling dotfiles repo
(setq jmf/dotfile-dirs-list
      (mapcar
       (lambda (d)
                (file-name-as-directory (expand-file-name d "~/.config")))
              '("~/"
                "Emacs_from_Scratch"
                "X11"
                "chemacs"
                "doom"
                "i3"
                "i3status"
                "pulse"
                "vim"
                "yapf"
                "zsh"
                "~/.local/share/oh-my-zsh/custom"
                "~/bin")))

(defun jmf/magit-process-environment (env)
  "Add GIT_DIR and GIT_WORK_TREE to ENV when in a special directory.
https://github.com/magit/magit/issues/460 (@cpitclaudel)."
  (let ((default (file-name-as-directory (expand-file-name default-directory))))
    (when (member default jmf/dotfile-dirs-list)
      (let ((gitdir (expand-file-name "~/.local/share/dotfiles/"))
            (home (expand-file-name "~/")))
        (push (format "GIT_WORK_TREE=%s" home) env)
        (push (format "GIT_DIR=%s" gitdir) env))))
  env)

(advice-add 'magit-process-environment
            :filter-return #'jmf/magit-process-environment)
