;; setting ace-jump-helm-line
(require 'ace-jump-helm-line)

(eval-after-load "helm"
  '(define-key helm-map (kbd "C-'") 'ace-jump-helm-line))

;;use another ace-jump-helm-line style
;; (setq ace-jump-helm-line-use-avy-style nil)

(provide 'init-ace-jump-helm-line)
