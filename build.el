;;; build.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Shom Bandopadhaya
;;
;; Author: Shom Bandopadhaya <https://github.com/shombando>
;; Maintainer: Shom Bandopadhaya <shom@bandopadhaya.com>
;; Created: October 04, 2021
;; Modified: August 20, 2024
;; Version: 0.0.1
;; Keywords: emacs org hugo
;; Homepage: https://git.sr.ht
;; Package-Requires: ((emacs "29.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary: automated build for ox-hugo org mode website
;;
;;  Description
;;
;;; Code:

;; Setup
(message "\n==== Setup package repos ====")
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install and dependencies
(message "\n==== Installing depedencies ====")
(package-install 'ox-hugo)
(require 'org-id)
(require 'ox-hugo)

;; Export content from org to Hugo md
(message "\n==== Exporting Hugo markdown ====")
(with-current-buffer (find-file "./content-org/content.org")
  (org-hugo-export-wim-to-md :all-subtrees nil :visible-only nil))

(message "\n==== Export complete ====")

;;; build.el ends here
