;; setting comment

;; 添加删除注释
;; 写程序的，要经常和注释打交道，注释和反注释一段代码是家常便饭。可惜，Emacs 虽然有这个功能，默认的配置却并不好用：

;; 注释/反注释这两个功能默认没有绑定快捷键
;; 需要先选中一段区域才能调用注释功能，哪怕只想注释/反注释当前行
;; 好在有一个 Alt-; 的快捷键，默认绑定了 comment-dwim，能注释/反注释当前激活的区域。如果没有激活区域，就在当前行末加注释
;; 其实 Alt-; 默认绑定的 comment-dwim 已经很理想了，可是，还是不够 dwim ( Do What I Mean )。能不能变成，如果没有激活的区域，就注释/反注释当前行，仅当在行尾的时候才在行尾加注释呢？下面的配置就是参考别人配置写的 “照我说的做”注释函数:

;; (defun qiang-comment-dwim-line (&optional arg)
;;   "Replacement for the comment-dwim command.
;; If no region is selected and current line is not blank and we are not at the end of the line,
;; then comment current line.
;; Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-set-key "\M-;" 'qiang-comment-dwim-line)
;; 这样一来，注释和反注释代码的操作只使用一个 Alt-; 键就全部搞定了，Emacs 会心领神会地“照我说的做”。



;; (defun qiang-comment-dwim-line (&optional arg)
;;   "Replacement for the comment-dwim command.
;; If no region is selected and current line is not blank and we are not at the end of the line,
;; then comment current line.
;; Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-set-key "\M-;" 'qiang-comment-dwim-line)

(global-set-key (kbd "M-;") 'comment-dwim-2)

(provide 'init-comment)
