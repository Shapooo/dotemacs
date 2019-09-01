;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

;; (when (maybe-require-package 'anaconda-mode)
;;   (after-load 'python
;;     (add-hook 'python-mode-hook 'anaconda-mode)
;;     (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
;;   (after-load 'anaconda-mode
;;     (define-key anaconda-mode-map (kbd "M-?") nil))
;;   (when (maybe-require-package 'company-anaconda)
;;     (after-load 'company
;;       (after-load 'python
;;         (push 'company-anaconda company-backends)))))

;; (when (require-package 'python-mode))


(when (require-package 'elpy)
  (elpy-enable)
  
  (when (executable-find "ipython")
    ;; (setq python-shell-interpreter "ipython"
    ;;       python-shell-interpreter-args "--pylab -i --simple-prompt"
    ;;       )
    ;; (setq python-shell-interpreter "python"
    ;;       python-shell-interpreter-args "-i")
    )
  
  (when (require-package 'flycheck)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))

(provide 'init-python)
;;; init-python.el ends here
