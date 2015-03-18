
;; -------------------------------------------------------------------------------
;; PACKAGE: nyan-mode                    
;;                                       
;; GROUOP: Environment -> Frames -> Nyan 
;; -------------------------------------------------------------------------------
;; only turn on if a window system is available
;; this prevents error under terminal that does not support X
(case window-system
  ((x w32) (nyan-mode)))

;; --------------------------------------------------------------------------------
;; 开启，为了出现一只猫
;;(nyan-mode t)
;; --------------------------------------------------------------------------------

(provide 'init-cat)
