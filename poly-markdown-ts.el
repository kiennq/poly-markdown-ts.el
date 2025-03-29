;;; poly-markdown-ts.el --- Polymode for markdown-ts-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2025
;; Version: 0.1
;; Package-Requires: ((emacs "30") (polymode "0.2.2") (markdown-ts-mode "0"))
;; URL: https://github.com/polymode/poly-markdown

;; Author: Kien Nguyen
;; Keywords: emacs

;; This file is *NOT* part of GNU Emacs.
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(require 'markdown-ts-mode)
(require 'polymode)

(define-hostmode poly-markdown-ts-hostmode
  :mode 'markdown-ts-mode)

(define-auto-innermode poly-markdown-ts-fenced-code-innermode
  :head-matcher (cons "^[ \t]*\\(```[ \t]*{?[[:alpha:].=].*\n\\)" 1)
  :tail-matcher (cons "^[ \t]*\\(```\\)[ \t]*$" 1)
  :mode-matcher (cons "```[ \t]*{?[.=]?\\(?:lang *= *\\)?\\([^ \t\n;=,}]+\\)" 1)
  :mode nil :fallback-mode 'host :head-mode 'host :tail-mode 'host)

;;;###autoload (autoload 'poly-markdown-ts-mode "poly-markdown-ts")
(define-polymode poly-markdown-ts-mode
  :hostmode 'poly-markdown-ts-hostmode
  :innermodes '(poly-markdown-ts-fenced-code-innermode))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.md\\'" . poly-markdown-ts-mode))
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . poly-markdown-ts-mode))

(provide 'poly-markdown-ts)
;;; poly-markdown-ts.el ends here


