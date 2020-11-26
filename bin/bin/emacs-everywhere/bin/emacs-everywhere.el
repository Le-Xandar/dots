(defun ea-on-linux ()
  (write-region (point-min) (point-max) "./clipboard")
  (kill-buffer "*Emacs Everywhere*")
  )

(defun ea-on-mac ()
  (clipboard-kill-ring-save
   (point-min)
   (point-max))
  (kill-buffer "*Emacs Everywhere*"))

(defun ea-on-delete (frame)
  (cond
   ((string-equal system-type "darwin") (ea-on-mac))
   ((string-equal system-type "gnu/linux") (ea-on-linux)))
  )

(defun ea-hook ()
  (add-hook 'delete-frame-functions 'ea-on-delete))

(defun ea-unhook ()
  (remove-hook 'delete-frame-functions 'ea-on-delete))

(defun emacs-everywhere ()
  (interactive)
  (if (y-or-n-p "On delete-frame copy current-buffer to clipboard and kill *Emacs Everywhere*? ")
      (ea-hook)
    (ea-unhook)))

(ea-hook)
(switch-to-buffer "*Emacs Everywhere*")
(select-frame-set-input-focus (selected-frame))
