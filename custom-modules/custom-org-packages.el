;;; crafted-org-packages.el --- Crafted Org Packages  -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; Packages to augment Org mode configuration

;;; Code:

;; conventions and grep instead.
(add-to-list 'package-selected-packages 'org-roam)

;;; Toggle the visibility of some Org elements.
(add-to-list 'package-selected-packages 'org-appear)

;; some org enhancements
(add-to-list 'package-selected-packages 'org-modern)
(add-to-list 'package-selected-packages 'org-present)
(add-to-list 'package-selected-packages 'org-contrib)

(provide 'custom-org-packages)
;;; crafted-org-packages.el ends here
