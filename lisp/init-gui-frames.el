
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1) )

;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro"
;;                     :height 115
;;                     :weight 'medium
;;                     :width 'medium)

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :height 150
                      :weight 'normal
                      :width 'normal)
  
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "WenQuanYi Micro Hei"
                                         :height 150))))

;; TODO: use seethru package instead?
(when (eq system-type 'gnu/linux)
  (defun sanityinc/adjust-opacity (frame incr)
    "Adjust the background opacity of FRAME by increment INCR."
    (unless (display-graphic-p frame)
      (error "Cannot adjust opacity of this frame"))
    (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
           ;; The 'alpha frame param became a pair at some point in
           ;; emacs 24.x, e.g. (100 100)
           (oldalpha (if (listp oldalpha) (car oldalpha) oldalpha))
           (newalpha (+ incr oldalpha)))
      (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
        (modify-frame-parameters frame (list (cons 'alpha newalpha))))))
  
  (global-set-key (kbd "M-C-8") (lambda () (interactive) (sanityinc/adjust-opacity nil -2)))
  (global-set-key (kbd "M-C-9") (lambda () (interactive) (sanityinc/adjust-opacity nil 2)))
  (global-set-key (kbd "M-C-7") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))
  )
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset (font-spec :family "Microsoft Yahei"
;;                                        :height 115)))

;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro"
;;                     :height 115
;;                     :weight 'normal
;;                     :width 'normal)


;; (add-to-list 'default-frame-alist
;;              '(font . "DejaVu Sans Mono-11" ))


(provide 'init-gui-frames)
