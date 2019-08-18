
(setq-default
 blink-cursor-interval 0.7
 scroll-step 1
 scroll-margin 3
 redisplay-dont-pause t
 scroll-conservatively 1000
 scroll-preserve-screen-position 'always
 column-number-mode t
 make-backup-files nil
 truncate-lines nil
 truncate-partial-width-windows nil
 case-fold-search t
 delete-selection-mode t
 indent-tabs-mode nil
 mouse-yank-at-point t
 tooltip-delay 1.5
 save-interprogram-paste-before-kill t
 set-mark-command-repeat-pop t
 font-lock-maximum-decoration t
 )

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)
(after-load 'autorevert
  (diminish 'auto-revert-mode))

(setq show-paren-delay 0)
(add-hook 'after-init-hook 'show-paren-mode)


;; (when (maybe-require-package 'beacon)
;;   (setq-default beacon-lighter "")
;;   (setq-default beacon-size 20)
;;   (add-hook 'after-init-hook 'beacon-mode))

(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))
;;; Newline behaviour

(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)

(after-load 'subword
  (diminish 'subword-mode))


(when (require-package 'rainbow-delimiters)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode) )

(when (fboundp 'global-prettify-symbols-mode)
  (add-hook 'after-init-hook 'global-prettify-symbols-mode))

(global-set-key (kbd "C-.") 'set-mark-command)


(setq inhibit-splash-screen t)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

;; (when (require-package 'fill-column-indicator)
;;   (define-global-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;   (global-fci-mode t)
;;   (setq fci-rule-width 1)
;;   ;; (setq fci-dash-pattern 0.9)
;;   (setq fci-rule-character 124)
;;   ;; (setq fci-tab-width 4)
;;   ;; (setq fci-column 4)
;;   ;; (setq fci-blank-char 124)
;;   )

(when (maybe-require-package 'beacon)
  (setq-default beacon-lighter "")
  (setq-default beacon-size 5)
  (add-hook 'after-init-hook 'beacon-mode))
  
(provide 'init-editing-utils)
