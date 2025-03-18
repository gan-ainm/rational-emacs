(use-package crafted-ide-packages)

;;;
;;; support for the Language Server Protocol
;;;
(add-to-list 'package-selected-packages 'lsp-mode)

;;;
;;; languages
;;;
;; Guile programming
(add-to-list 'package-selected-packages 'geiser)
(add-to-list 'package-selected-packages 'geiser-guile)
;; Rust programming
(add-to-list 'package-selected-packages 'rustic)
;; Ansible
(add-to-list 'package-selected-packages 'ansible)
(add-to-list 'package-selected-packages 'ansible-doc)
(add-to-list 'package-selected-packages 'ansible-vault)

(provide 'custom-ide-packages)
