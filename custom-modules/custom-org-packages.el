;;; custom-org-packages.el --- Custom Org Packages  -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; Packages to augment Org mode configuration

;;; Code:

(add-to-list 'package-selected-packages 'org-roam)
(add-to-list 'package-selected-packages 'org-roam-ui)

;; some org enhancements
(add-to-list 'package-selected-packages 'org-modern)
(add-to-list 'package-selected-packages 'org-present)
(add-to-list 'package-selected-packages 'org-contrib)
(add-to-list 'package-selected-packages 'org-transclusion)

(add-to-list 'package-selected-packages 'org-pdftools)
(add-to-list 'package-selected-packages 'org-noter)
(add-to-list 'package-selected-packages 'org-noter-pdftools)

;; more evil
(add-to-list 'package-selected-packages 'evil-org)

;;; Toggle the visibility of some Org elements.
(add-to-list 'package-selected-packages 'org-appear)

(provide 'custom-org-packages)
;;; crafted-org-packages.el ends here
