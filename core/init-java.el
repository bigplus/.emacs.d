(require )
(defun java-eval-nofocus ()
  "run current program (that requires no input)"
  (interactive)
  (let* ((source (file-name-nondirectory buffer-file-name))
         (out    (file-name-sans-extension source))
         (class  (concat out ".class")))
    (save-buffer)
    (shell-command (format "rm -f %s && javac %s" class source))
    (if (file-exists-p class)
        (shell-command (format "java %s" out) "*scratch*")
      (progn
        (set (make-local-variable 'compile-command)
             (format "javac %s" source))
        (command-execute 'compile)))))

(define-key java-mode-map [C-f5] 'java-eval-nofocus)

(provide 'init-java)
