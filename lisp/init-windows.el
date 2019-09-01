;;; init-windows.el --- Working with windows within frames -*- lexical-binding: t -*-
;;; Commentary:

;; This is not about the "Windows" OS, but rather Emacs's "windows"
;; concept: these are the panels within an Emacs frame which contain
;; buffers.

;;; Code:

(when (require-package 'switch-window)
  (setq-default switch-window-shortcut-style 'alphabet
                switch-window-timeout nil)
  (global-set-key (kbd "C-x o") 'switch-window))


;;----------------------------------------------------------------------------
;; When splitting window, show (other-buffer) in the new window
;;----------------------------------------------------------------------------
(defun split-window-func-with-other-buffer (split-function)
  (lambda (&optional arg)
    "Split this window and switch to the new window unless ARG is provided."
    (interactive "P")
    (funcall split-function)
    (let ((target-window (next-window)))
      (set-window-buffer target-window (other-buffer))
      (unless arg
        (select-window target-window)))))

(global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer 'split-window-horizontally))


(when (require-package 'winner)
  (add-hook 'after-init-hook 'winner-mode)
  (global-set-key (kbd "C-c u") 'winner-undo)
  (global-set-key (kbd "C-c r") 'winner-redo))


(when (require-package 'shackle)

  ;; (setq shackle-rules '((occur-mode :other t)
  ;;                       (flycheck-mode :orther t)))
  ;; (setq ;; shackle-default-rule '(:select t :size 0.33)
  ;;  shackle-rules '((occur-mode    :select t    :size 0.25)
  ;;                  (Help-Mode     :select t    :size 0.25)))
  ;; (setq shackle-default-rule '(:other t  :size 0.25))
  (setq shackle-default-alignment 'below
        shackle-default-size 0.3
        shackle-default-rule '(:popwin t   :select nil  :align 'below)
        shackle-rules '(;; (help-mode               :align right :select nil)
                        ;; (compilation-mode        :select t    :size 0.25)
                        (occur-mode              :select t    :align right :size 0.3)
                        ;; ("*Python Doc*"          :other t)
                        ("*compilation*"         :select t    :size 0.25 :inhibit-window-quit t)
                        ;; ("*ag search*"           :select nil  :size 0.25)
                        ("*Flycheck errors*"     :select nil  :size 0.25 :align 'below)
                        ("*Warnings*"            :select nil  :size 0.25)
                        ("*Error*"               :select nil  :size 0.25)
                        ;; ("*Org Links*"           :select nil  :size 0.2)
                        ;; ("^\\*git-gutter.+\\*$"  :regexp t    :size 15 :noselect t)
                        ;; Do not show Async Shell Command output unless explicitly asked for.
                        ;; ("*Async Shell Command*" :ignore t)
                        ))



  (shackle-mode)
  )

(provide 'init-windows)
