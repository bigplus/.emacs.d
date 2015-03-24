;;--------------------------------------------------------------------------------
;; org-mode org-2-html
(require 'ox-publish)
(setq org-publish-project-alist
  '(
	;; org-notes
        ("org-notes"               ;Used to export .org file
         :base-directory "~/org/"  ;directory holds .org files 
         :base-extension "org"     ;process .org file only    
         :publishing-directory "~/public_html/"    ;export destination
         ;:publishing-directory "/ssh:user@server" ;export to server
         :recursive t
         ;:publishing-function org-publish-org-to-html
	 :publishing-function org-html-publish-to-html
         :headline-levels 4               ; Just the default for this project.
         :auto-preamble nil
         :auto-sitemap t                  ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :export-creator-info nil    ; Disable the inclusion of "Created by Org" in the postamble.
         :export-author-info nil     ; Disable the inclusion of "Author: Your Name" in the postamble.
         :table-of-contents t        ; Set this to "t" if you want a table of contents, set to "nil" disables TOC.
         :section-numbers nil        ; Set this to "t" if you want headings to have numbers.
         :auto-postamble t         ; Disable auto postamble
         :html-postamble get-intranet-postamble ;; "    <p class=\"postamble\">Last Updated %d.</p> " ; your personal postamble
         :style-include-default nil  ;Disable the default css style
	 )
	;; org-static
        ("org-static"                ;Used to publish static files
         :base-directory "~/org/static_files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
	;; org
        ("org" :components ("org-notes" "org-static")) ;combine "org-static" and "org-static" into one function call

	;;--------------------
	;; bigdata-static
        ("bigdata-static"                ;Used to publish static files
         :base-directory "~/org/static_files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/bigdata/"
         :recursive t
         :publishing-function org-publish-attachment
         )
	;;--------------------
	;; jerry-static
        ("jerry-static"                ;Used to publish static files
         :base-directory "~/org/static_files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/jerry/"
         :recursive t
         :publishing-function org-publish-attachment
         )
	;;--------------------
	;; algo-static
        ("algo-static"                ;Used to publish static files
         :base-directory "~/org/static_files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/algo/"
         :recursive t
         :publishing-function org-publish-attachment
         )
	;;--------------------
	;; others-static
        ("others-static"                ;Used to publish static files
         :base-directory "~/org/static_files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/others/"
         :recursive t
         :publishing-function org-publish-attachment
         )

	 ;;--------------------

	("all" :components ("org" "bigdata-static" "jerry-static" "algo-static" "others-static"))
	("bigdata-static" :components ("bigdata-static"))

))

;;--------------------------------------------------------------------------------
;; htmlize org输出的html代码段高亮
;(require 'htmlize)

;;--------------------------------------------------------------------------------
;; org2html 脚本
(defun get-intranet-postamble (plist)
  (let ((title (plist-get plist :title))
        (creator (plist-get plist :creator))
        (time (format-time-string org-html-metadata-timestamp-format))
        )
    (format 
     "<p>
     <a href=\"mailto:%s?Subject=Comments on %s\">Send a feedback</a>
     </p>

     <p>
     <span class=\"date\">Created: %s</span> by <span class=\"creator\"> Jerry </span>
     </p>"
     "zhuyu.deng@gmail.com" title time)))

;;---------------------------------------------------------------------------------------------------------------------------------------
;;(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/org.css\" />")
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/org.css\" />")

;(setq org-export-html-validation-link nil)
;(setq org-html-validation-link nil)
;;(setq org-src-fontify-natively t)
;;-------------------------------------------------------------------------------------------------
;(setf org-html-postamble nil)
;;(setf org-html-scripts "")

;;(setf org-html-postamble-format
;;      (list
;;       (list
;;	"en"
;;	(concat
;;	 "<p>By <a href='https://pavpanchekha.com' rel='author'>%a</a>.\n"
;;	 "Share it—it's <a href='http://creativecommons.org/licenses/by-sa/4.0' rel='license'>CC-BY-SA licensed</a>.</p>"))))
;; (setq org-html-postamble "whatever you want, make sure its html though")

(provide 'init-org)
