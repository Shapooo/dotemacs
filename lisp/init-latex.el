
(when (require-package 'auctex)
  (mapc (lambda (mode)
          (add-hook 'latex-mode-hook mode))
        (list 'latex-math-mode))

  (add-hook 'latex-mode-hook
            (lambda ()
              (setq TeX-engine 'xetex
                    TeX-show-compilation nil
                    TeX-save-query nil)

              (TeX-global-PDF-mode t)
              ))
  )

(provide 'init-latex)
