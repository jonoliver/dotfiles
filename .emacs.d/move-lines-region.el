;;move lines up and down
(defun move-line-up ()
	  (interactive)
		  (transpose-lines 1)
			  (forward-line -2))

(defun move-line-down ()
	  (interactive)
		  (forward-line 1)
			  (transpose-lines 1)
				  (forward-line -1))

;;move region up and down
(defun move-region (start end n)
	  "Move the current region up or down by N lines."
		  (interactive "r\np")
			  (let ((line-text (delete-and-extract-region start end)))
					    (forward-line n)
							    (let ((start (point)))
										      (insert line-text)
													      (setq deactivate-mark nil)
																      (set-mark start))))

(defun move-region-up (start end n)
	  "Move the current line up by N lines."
		  (interactive "r\np")
			  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
	  "Move the current line down by N lines."
		  (interactive "r\np")
			  (move-region start end (if (null n) 1 n)))

(provide 'move-lines-region)