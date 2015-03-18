;;
;; 以下为Jerry添加的自定义设置
;;

;;--------------------------------------------------------------------------------
;; 显示行列号
(setq line-number-mode t)
(global-linum-mode t)
(setq column-number-mode t)


;;--------------------------------------------------------------------------------
(setq-default cursor-type 'bar) ; 设置光标为竖线
;; 若希望光标设置为黑方块，则加入一行
;; (setq-default cursor-type 'box) ; 设置光标为方块
;; 保存完毕，重启emacs即可


;; --------------------------------------------------------------------------------
;; 填入大中小括号，双单引号的匹配
;; 详细格式可以参照C-h f skeleton-pair-alist
(setq skeleton-pair-alist
      '((?\" _ "\"" >)
        (?\' _ "\'" >)
        (?\( _ ")" >)
        (?\[ _ "]" >)
        (?\{ _ "}" >)))

(setq skeleton-pair t)

;; --------------------------------------------------------------------------------
;; go-to-column
(defun go-to-column (column)
  (interactive "nColumn: ")
  (move-to-column column t))
(global-set-key (kbd "M-g M-c") 'go-to-column)

;; --------------------------------------------------------------------------------
;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;;--------------------------------------------------------------------------------
;; smart-open-line
(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(shift return)] 'smart-open-line)

;; 初始化界面
(setq-default initial-scratch-message
              (concat ";; Happy hacking " (or user-login-name "") " - Emacs ♥ you!\n\n"))

;; 更改标记 标记Mark 的 快捷键设置
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; --------------------------------------------------------------------------------
;;通过这个，我们可以通过C-t加上指定字符向后跳，后者C-u C-t向前跳。比如C-t w w w w …就一直往后跳到后续的w处。
;; 跳到指定字符
(defun my-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `my-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (let ((case-fold-search nil))
    (if (eq n 1)
        (progn                            ; forward
          (search-forward (string char) nil nil n)
          (backward-char)
          (while (equal (read-key)
                        char)
            (forward-char)
            (search-forward (string char) nil nil n)
            (backward-char)))
      (progn                              ; backward
        (search-backward (string char) nil nil )
        (while (equal (read-key)
                      char)
          (search-backward (string char) nil nil )))))
  (setq unread-command-events (list last-input-event)))
(global-set-key (kbd "C-x C-t") 'my-go-to-char)
;; --------------------------------------------------------------------------------

(provide 'init-custom)
