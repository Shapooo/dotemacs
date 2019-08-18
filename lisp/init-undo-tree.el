;; (require-package 'undo-tree)
;; (require 'undo-tree-autoloads)
;; (global-set-key "\C-xu" 'undo-tree-visualize)
;; (global-undo-tree-mode t)
(when (require-package 'undo-tree)
  (global-set-key "\C-xu" 'undo-tree-visualize)
  (global-undo-tree-mode t)
  (diminish 'undo-tree-mode))

(provide 'init-undo-tree)
