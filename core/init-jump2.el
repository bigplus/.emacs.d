;; setting init-jump2.el
;; 临时记号
;有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。
;你当然可以 使用 bookmark 或者寄存器。但是这些实在是太慢了。
;你多想拥有vi那样的 ma, mb, 'a, 'b 的操作。现在你可以用几行 elisp 达到类似的目的：

;当你按 C-. 时就做了一个记号。然后你可以到别处，按 C-, 就可以在这两点之 间来回跳转了。
;这虽然没有 vi 的 26 个 mark 多，但是你仔细想想，vi的26个 mark，你通常能用到几个？
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)

(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
   Use ska-jump-to-register to jump back to the stored 
   position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

(provide 'init-jump2)
