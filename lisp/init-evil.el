
(when (maybe-require-package 'evil)
  (global-set-key (kbd "C-c v") 'evil-mode))

(provide 'init-evil)
