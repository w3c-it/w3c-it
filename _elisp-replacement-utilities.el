(defun extract ()
  (interactive)
  (goto-char (point-min))
  (re-search-forward "<h1>\\([^<]+\\)</h1>")
  (let ((title (buffer-substring (match-beginning 1) (match-end 1))))
    (let ((title
           (replace-regexp-in-string "  +" " " 
                                     (replace-regexp-in-string "[\t\n]+" "" title))))
      (re-search-forward "<h2>\\([^<]+\\)</h2>")
      (let ((subtitle (buffer-substring (match-beginning 1) (match-end 1))))
        (let ((subtitle
               (replace-regexp-in-string "  +" " "
                                         (replace-regexp-in-string "[\t\n]+" "" subtitle))))
          (beginning-of-buffer)
          (insert "---\ntitle: " title "\ndescription: >\n  " subtitle "\ndate: \n---\n"))))))
    
(setq italian-accents
      '(("à" . "&agrave;")
        ("è" . "&egrave;")
        ("é" . "&eacute;")
        ("ì" . "&igrave;")
        ("ò" . "&ograve;")
        ("ù" . "&ugrave;")
        ("È" . "&Egrave;")))

(defun replace-accented-letters ()
  (interactive)
  (replace-accented-letters-ll italian-accents))

(defun replace-accented-letters-ll (list)
  (if list
      (let ( (substitution (car list)) )
        (beginning-of-buffer)
        (while (re-search-forward (car substitution) nil t)
          (replace-match (cdr substitution)))
        (replace-accented-letters-ll (cdr list)))))
        
