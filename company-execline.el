;;; company-execline.el --- Company backend for execline -*- lexical-binding: t; -*-

;; Copyright (C) 2016 Eric Le Bihan
;; Author: Eric Le Bihan <eric.le.bihan.dev@free.fr>
;; Version: 0.2.0
;; Keywords: languages
;; URL: https://github.com/elebihan/company-execline/
;; Package-Requires: ((emacs "24.0") (company "0.8.0"))

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, see <http://www.gnu.org/licenses/>.

;; Commentary:

;; Company backend for [execline][].
;;
;; Installation:
;;
;; Add the following lines to `.emacs':
;;
;;    (add-to-list 'load-path "/path/to/company-execline/")
;;    (require 'company-execline)
;;
;;    (with-eval-after-load 'company
;;      (add-to-list 'company-backends 'company-execline))
;;
;;
;; [execline]: http://skarnet.org/software/execline/index.html


;; Code:

(eval-when-compile (require 'cl-lib))
(require 'company)

(defconst execline-proc-progs
  '("cd"
    "umask"
    "emptyenv"
    "export"
    "unexport"
    "fdclose"
    "fdblock"
    "fdmove"
    "fdswap"
    "fdreserve"
    "redirfd"
    "piperw"
    "heredoc"
    "wait"
    "getcwd"
    "getpid"
    "exec"
    "tryexec"
    "exit"
    "trap"
    "withstdinas"))

(defconst execline-block-progs
  '("foreground"
    "background"
    "if"
    "ifelse"
    "ifte"
    "backtick"
    "ifthenelse"
    "pipeline"
    "runblock"))

(defconst execline-var-progs
  '("define"
    "importas"
    "import"
    "elglob"
    "elgetpositionals"
    "multidefine"
    "multisubstitute"))

(defconst execline-loop-progs
  '("forx"
    "forstdin"
    "forbacktickx"
    "loopwhilex"))

(defconst execline-opt-progs
  '("elgetopt"
    "shift"
    "dollarat"))

(defconst execline-misc-progs
  '("homeof"))

(defconst execline-builtin-progs
  (append execline-proc-progs
          execline-block-progs
          execline-var-progs
          execline-loop-progs
          execline-opt-progs
          execline-misc-progs))

(defun company-execline (command &optional arg &rest ignored)
  "`company-mode' completion back-end for execline.
Provide completion info according to COMMAND and ARG. IGNORED, not used."
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'company-execline))
    (prefix (and (derived-mode-p 'execline-mode)
                 (company-grab-symbol)))
    (candidates
     (remove-if-not
      (lambda (c) (string-prefix-p arg c))
      execline-builtin-progs))))

(provide 'company-execline)

;;; company-execline.el ends here
