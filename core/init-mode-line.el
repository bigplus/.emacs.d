;; use setq-default to set it for /all/ modes
;; http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
(defun my-mode-line ()
  (setq-default
   mode-line-format
   (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face 'font-lock-keyword-face
        		'help-echo (format "%s" (buffer-file-name))
                        ))

    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
			'face 'font-lock-preprocessor-face
			'help-echo (concat "Buffer is in "
					   (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
	      (concat ","  (propertize "Mod"
				       'face 'font-lock-warning-face
				       'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
	      (concat ","  (propertize "RO"
				       'face 'font-lock-type-face
				       'help-echo "Buffer is read-only"))))
    "] "

    ;; ;; line and column
    ;; "(" ;; '%02' to set to 2 chars at least; prevents flickering
    ;; (propertize "%01l" 'face 'font-lock-type-face) ","
    ;; (propertize "%02c" 'face 'font-lock-type-face)
    ;; ") "

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top

    ;; (propertize "%I" 'face 'font-lock-constant-face) ;; size
    '(:eval (when (and (not (buffer-modified-p)) my-mode-line-buffer-line-count)
              (propertize (concat "/" my-mode-line-buffer-line-count "L")
                          'face 'font-lock-type-face
                          )))

    "] "

    ;; the current major mode for the buffer.
    "["
    ;; mode-line-modes ;; too much infomation
    
    '(:eval (propertize "%m" 'face 'font-lock-string-face
    			'help-echo buffer-file-coding-system))
    
    "] "

    '(:eval (when vc-mode
	      (concat "["
		      (propertize (string-strip (format "%s" vc-mode)) 'face 'font-lock-variable-name-face)
		      "] "
		      )))

    ;; '(:eval (format "Proj[%s] " (projectile-project-name)))

    ;; add the time, with the date and the emacs uptime in the tooltip
    '(:eval (propertize (format-time-string "%H:%M:%S")
			'face 'font-lock-type-face
			'help-echo
			(concat (format-time-string "%Y-%02m-%02d %02H:%02M:%02S %Y-%02m-%02d %3a; ")
				(emacs-uptime "Uptime:%hh"))))

    ;; show buffer file name
    '(:eval (when show-buffer-file-name
	      (format " [%s]" (buffer-file-name))))

    " "

    ;; date
    '(:eval (propertize (format-time-string "%Y-%02m-%02d %3a")
			'face 'font-lock-comment-face))


    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'

    ;; mode-line-modes mode-line-misc-info mode-line-end-spaces
    ))
  ;; 这里不知道Emacs发生啥事，初始化完成后，mode-line-format就被设置回默认值。
  ;; (setq default-mode-line-format mode-line-format) ; 奇葩了，没有这行它就没法设置成功
  )
(my-mode-line)

;(setq sml/theme 'dark)
;(sml/setup)

(provide 'my-mode-line)

;; -------------------- mode line --------------------
