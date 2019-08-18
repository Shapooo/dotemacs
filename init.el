
;; (defconst *is-a-windows* (eq system-type 'windows-nt))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

(require 'init-elpa)
(require 'init-utils)

(require 'init-ibuffer)
(require 'init-recentf)
(require 'init-editing-utils)
(require 'init-themes)
(require 'init-flycheck)
(require 'init-lisp)
(require 'init-company)
(require 'init-ivy)
(require 'init-windows)
(require 'init-isearch)
(require 'init-misc)
(require 'init-latex)
(require 'init-smex)
(require 'init-undo-tree)
(require 'init-org)
(require 'init-gui-frames)
(require 'init-sessions)
(require 'init-evil)
(require 'init-python)

(add-to-list 'load-path "~/elpa-mirror")
(require 'elpa-mirror)
;; (require 'init-locales)
;; (require 'init-whitespace)
;; (require 'init-sessions)
;; (require 'init-benchmarking
;; (require-package 'diminish)
;; (require-package 'evil)

;;(defhydra hydra-zoom (global-map "<f2>")
;;"zoom"
;;  ("g" text-scale-increase "in")
;;("l" text-scale-decrease "out"))

(when (file-exists-p custom-file)
  (load custom-file))


(provide 'init)
