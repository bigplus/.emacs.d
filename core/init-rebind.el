;; setting rebind

;;这个是 Emacs 自带的功能，可是知道它的人不多。很多人用的是M-/ (dabbrev-expand) 这样的东西。 hippie-expand 要强大的多。因为它可以使用 扩展函数任意扩充！你可以把你的 M-/ 绑定到 hippie-expand，马上就可以体 会到它的方便。
(global-set-key [(meta ?/)] 'hippie-expand)

;; 你可以设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面的函数来补全。通常我的设置是：
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

(provide 'init-rebind)
