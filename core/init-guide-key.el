(require 'guide-key)
(guide-key-mode 1)  ; Enable guide-key-mode
;; (setq guide-key/idle-delay 0.1)

(defun guide-key/my-hook-function-for-python-mode ()
  (guide-key/add-local-guide-key-sequence "C-c")
  (guide-key/add-local-highlight-command-regexp "rope-")
  (guide-key/add-local-highlight-command-regexp "py-")
  (guide-key/add-local-highlight-command-regexp "python-"))
(add-hook 'python-mode-hook 'guide-key/my-hook-function-for-python-mode)

(defun guide-key/my-hook-function-for-org-mode ()
  (guide-key/add-local-guide-key-sequence "C-c")
  (guide-key/add-local-guide-key-sequence "C-c C-x")
  (guide-key/add-local-highlight-command-regexp "org-"))
(add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

(setq guide-key/guide-key-sequence
;;      '("C-x r" "C-x 4" "C-x 5" "C-c p"
      '("C-x r" "C-x 4" "C-x 5" "C-c p" "C-c"
        (org-mode "C-c C-x")
        (outline-minor-mode "C-c @")
        (markdown-mode "C-c C-a")
        ))
(setq guide-key/recursive-key-sequence-flag t)

(provide 'init-guide-key)
