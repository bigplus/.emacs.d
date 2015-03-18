;; multiple-cursors settings

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;## Unknown commands
;So that's why multiple-cursors occasionally asks what to do about a command. It will
;then remember your choice by saving it in `~/.emacs.d/.mc-lists.el`. You can change
;pthe location with:
;(setq mc/list-file "~/.emacs.d/.mc-lists.el")

(provide 'init-multiple-cursors)
