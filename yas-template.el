;;; yas-template --- Insert file templates for new files using Yasnippet

;; Copyright (C) 2011 John Wiegley

;; Author: John Wiegley <jwiegley@gmail.com>
;; Created: 20 Aug 2011
;; Version: 1.0
;; Keywords: snippet template skeleton
;; X-URL: https://github.com/jwiegley/yas-template

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; For every major-mode which defines a template named "_header", when
;; creating a new file of that type expand the header template to create its
;; initial contents.
;;
;; Install as follows:
;;
;;   (require 'yas-template)
;;   (yas-template-install)

(require 'yasnippet)

(defgroup yas-template nil
  "Insert file templates for new files using Yasnippet"
  :group 'yasnippet)

;;;###autoload
(defun yas-template-insert (&rest ignore)
  (when (and (bobp) (eobp))
    (insert "_header")
    (call-interactively #'yas/expand)))

;;;###autoload
(defun yas-template-install ()
  (add-hook 'find-file-hook 'yas-template-insert))

(provide 'yas-template)

;;; yas-template.el ends here
