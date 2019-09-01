;;; init-org.el --- Org-mode config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'org-download)
(add-hook 'org-mode-hook 'org-download-enable)

(setq org-src-fontify-natively t)

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `(;; (R . t)
     ;; (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     ;; (gnuplot . t)
     ;; (haskell . nil)
     (latex . t)
     ;; (ledger . t)
     ;; (ocaml . nil)
     ;; (octave . t)
     (plantuml . t)
     (python . t)
     ;; (ruby . t)
     (screen . nil)
     ;; (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     ;; (sql . nil)
     ;; (sqlite . t)
     )))


(provide 'init-org)
;;; init-org.el ends here
