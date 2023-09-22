(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

(load "~/.local/share/crafted-emacs/modules/crafted-init-config")
(setq debug-on-quit t)
(require 'crafted-evil-packages)
(require 'crafted-completion-packages)
(require 'crafted-org-packages)
(require 'crafted-ui-packages)
(require 'crafted-workspaces-packages)
(require 'crafted-writing-packages)

(add-to-list 'package-selected-packages 'magit)
(add-to-list 'package-selected-packages 'doom-themes)
(add-to-list 'package-selected-packages 'modus-themes)
(add-to-list 'package-selected-packages 'ef-themes)
(add-to-list 'package-selected-packages 'which-key)
(add-to-list 'package-selected-packages 'ement)
(add-to-list 'package-selected-packages 'vterm)

(package-install-selected-packages :noconfirm)

(require 'package-vc)

(add-to-list 'package-vc-selected-packages
  '(org-timeblock :url "https://github.com/ichernyshovvv/org-timeblock/"))

(package-vc-install-selected-packages)

(require 'crafted-defaults-config)

(require 'crafted-evil-config)
(require 'crafted-completion-config)
(require 'crafted-org-config)
(require 'crafted-ui-config)
(require 'crafted-workspaces-config)
(require 'crafted-writing-config)
(require 'crafted-updates-config)

(require 'magit)

;(require 'doom-themes)
;(load-theme 'doom-solarized-dark t)
;(require 'modus-themes)
;(load-theme 'modus-vivendi-tinted)
(load-theme 'ef-night)

(require 'which-key)
(which-key-mode 1)

(require 'ement)
(require 'vterm)

(keymap-set evil-normal-state-map "C-," 'embark-act)
(menu-bar-mode -1)
(tool-bar-mode -1)
