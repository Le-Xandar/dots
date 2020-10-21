;; DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

(setq user-full-name "Westofer Raymond"
      user-mail-address "WestoferRaymond@gmail.com")

(setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 11))

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type 'relative)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(map!
 ;; :n "<f5>" compile TODO: add compile
 :n "C-<f5>" 'compile-on-save-mode
 :n "<f6>" 'elfeed
 :n "<f8>" 'org-agenda
 ;; :n "<f7>" email TODO: Add email
 )

(map!
 :n "C-<f5>" 'compile-on-save-mode
 )

(map! "C-h" 'backward-delete-char-untabify)

  (setq org-hide-emphasis-markers t)

(setq org-agenda-custom-commands
      '(("d" "Today"
         ((tags-todo "SCHEDULED<\"<+1d>\"&PRIORITY=\"A\""
                     ((org-agenda-skip-function
                       '(org-agenda-skip-entry-if 'todo 'done))
                      (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-span 1)
                      (org-scheduled-delay-days -14)
                      (org-agenda-overriding-header "Schedule")))
          (tags-todo "SCHEDULED<\"<+1d>\""
                     ((org-agenda-skip-function
                       '(or (org-agenda-skip-entry-if 'done)))
                      (org-agenda-overriding-header "Tasks:")))))))

(setq-default fill-column 120)

(setq org-directory "~/Documents/gtd/")

'(org-format-latex-options
  (quote
   (:foreground default :background default :scale 0.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
    ("begin" "$1" "$" "$$" "\\(" "\\["))))
(set-default 'preview-scale-function 0.2)

(setq org-latex-create-formula-image-program 'imagemagick)

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(defun update-org-latex-fragments ()
  (org-latex-preview '(64))
  (plist-put org-format-latex-options :scale text-scale-mode-amount)
  (org-latex-preview '(16)))
(add-hook 'text-scale-mode-hook 'update-org-latex-fragments)

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))

(setq rustic-lsp-server 'rust-analyzer)

(add-hook 'rust-mode-hook #'racer-mode)

(define-derived-mode genehack-vue-mode web-mode "ghVue"
  "A major mode derived from web-mode, for editing .vue files with LSP support.")

(require 'eglot)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . genehack-vue-mode))
(add-hook 'genehack-vue-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))

(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

(add-to-list 'company-backends 'company-yasnippet)
(add-to-list 'company-backends 'company-dabbrev-code)
(add-to-list 'company-backends 'company-capf)
(add-to-list 'company-backends 'company-keyword)
(add-to-list 'company-backends 'company-files)

(defun compile-on-save-start ()
  (let ((buffer (compilation-find-buffer)))
    (unless (get-buffer-process buffer)
      (recompile))))

(define-minor-mode compile-on-save-mode
  "Minor mode to automatically call `recompile' whenever the
current buffer is saved. When there is ongoing compilation,
nothing happens."
  :lighter " CoS"
  (if compile-on-save-mode
      (progn  (make-local-variable 'after-save-hook)
              (add-hook 'after-save-hook 'compile-on-save-start nil t))
    (kill-local-variable 'after-save-hook)))

(setq-default elfeed-search-filter "@1-week-ago")

(setq rmh-elfeed-org-files (list "~/.doom.d/elfeed.org"))

(setf url-queue-parallel-processes 20
      url-queue-timeout 10)

(map!  :map elfeed-search-mode-map
       :n "v" 'elfeed-view-mpv
       :n "R" 'elfeed-update
       :n "G" 'evil-goto-line
       :n "<f6>" 'elfeed-close-prev-buffer
       :n "b" 'elfeed-search-browse-url
       :n "c" 'elfeed-search-clear-filter
       )

(defun elfeed-close-prev-buffer ()
  (interactive)
  "elfeed-kill and restore prev buffer"
  (elfeed-kill-buffer)
  (previous-buffer))

(defun elfeed-v-mpv (url title)
  "Watch a video from URL in MPV"
  (defvar cmd (format "mpv --ytdl-format=worst  '%s'" url))
  (save-window-excursion
    (async-shell-command cmd)
    (save-window-excursion
      (shell-command (format"notify-send 'Loading Video' '%s'" title)))
    (message "Video Loading")
    )
  )


(defun elfeed-view-mpv (&optional use-generic-p)
  "Youtube-feed link"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (elfeed-v-mpv it (elfeed-entry-title entry))) ;; print title
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))
