;; -------------------------------------------------------- 自娱自乐 ---------------
;; Jerry-Custom Start
(require 'init-custom)
;; Jerry-Custom Stop

;;; 添加多光标 multiple-cursors
(require 'init-multiple-cursors)

;; 默认开启，窗口的前进后退
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; --------------------------------------------------------------------------------
;(require 'prelude-python)

;; 激活其他的 emacs 资源
(require 'init-package)

;; helm 激活
(require 'prelude-helm-everywhere)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: dired+                     ;;
;;                                     ;;
;; GROUP: Files -> Dired -> Dired Plus ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'dired+)

;; -----------------------------------------------------------------------------
;; 初始化猫咪
;;(require 'init-cat)

;; -----------------------------------------------------------------------------
;; 添加 ibuffer-vc 特性
(require 'init-ibuffer-vc)
;; -----------------------------------------------------------------------------

;; 添加 switch-window : 当窗口数大于3的时候，C-x o 出现 a， b， c， 提供你选择。
(require 'init-windows)

;(require 'window-number)
;(window-number-mode 1)

;; 在窗口的 mode-line的最左边出现当前窗口的数字编号，M-【num】 跳转到相应的窗口，为激活状态
(require 'window-numbering)
;; highlight the window number in pink color
(custom-set-faces '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold)))))
(window-numbering-mode 1)

;; --------------------------------------------------------------------------------
(require 'init-utils)
;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(show-paren-mode 1)

;; 添加 key-guide
(require 'init-guide-key)

;; 添加 goto-last-change
(require 'init-goto-last-change)

;; 添加 minimap
(require 'init-minimap)

(require 'find-file-in-project)
(global-set-key (kbd "C-x f") 'find-file-in-project)

(setq aw-background t)


(require 'init-fill-column-indicator)

(require 'init-nxml)

(require 'init-gold-ratio)
(setq whitespace-mode nil)
(setq prelude-flyspell nil)
(setq prelude-clean-whitespace-on-save nil)

;; 高亮 column 
(require 'init-col-highlight)

;; hightlight current line
(require 'init-highlight-current-line)

;; 添加 yasnippet
(require 'init-yasnippet)
;
;; 添加 auto-complete
(require 'init-auto-complete)

;; 添加org
(require 'init-org)

;; center-cusor
(require 'init-centered-cursor)

;; ace-jump-helm-line
(require 'init-ace-jump-helm-line)

;; comment
(require 'init-comment)

;; paredit
(require 'init-paredit)

;; rebind
(require 'init-rebind)

;; cursor-color
(require 'init-smart-cursor-color)

;; swbuff
(require 'init-swbuff)

;; -------- part-config --------
(global-set-key (kbd "C-:") 'avy-goto-char)

;; -------- mode line --------
;(require 'init-mode-line)

;;(transient-mark-mode t)

;; -------- plugin --------
(add-to-list 'load-path "/Users/yp-tc-m-2505/.emacs.d/plugins/org-asciidoc/")
(require 'ox-asciidoc)

(provide 'my-init-config)
