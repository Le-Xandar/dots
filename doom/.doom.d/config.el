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

;; (setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 11))
;;(setq doom-font (font-spec :family "Open Sans" :size 12 :weight 'regular)
;;doom-variable-pitch-font (font-spec :family "sans" :size 12))

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type 't)

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

(setq-default fill-column 80)

(setq scroll-conservatively 10)
(setq scroll-margin 5)

(add-hook 'text-mode-hook 'mixed-pitch-mode)

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

(after! org (add-hook 'org-mode-hook 'turn-on-org-cdlatex))

(cl-defmacro lsp-org-babel-enable (lang)
  "Support LANG in org source code block."
  (setq centaur-lsp 'lsp-mode)
  (cl-check-type lang stringp)
  (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
         (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
    `(progn
       (defun ,intern-pre (info)
         (let ((file-name (->> info caddr (alist-get :file))))
           (unless file-name
             (setq file-name (make-temp-file "babel-lsp-")))
           (setq buffer-file-name file-name)
           (lsp-deferred)))
       (put ',intern-pre 'function-documentation
            (format "Enable lsp-mode in the buffer of org source block (%s)."
                    (upcase ,lang)))
       (if (fboundp ',edit-pre)
           (advice-add ',edit-pre :after ',intern-pre)
         (progn
           (defun ,edit-pre (info)
             (,intern-pre info))
           (put ',edit-pre 'function-documentation
                (format "Prepare local buffer environment for org source block (%s)."
                        (upcase ,lang))))))))
(defvar org-babel-lang-list
  '("go" "python" "ipython" "bash" "sh"))
(dolist (lang org-babel-lang-list)
  (eval `(lsp-org-babel-enable ,lang)))

(use-package org-roam-server
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8078
        org-roam-server-export-inline-images t
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (unless (server-running-p)
      (org-roam-server-mode 1))
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))

(setq org-roam-directory "~/Documents/roam/")

(add-hook 'org-mode-hook #'mixed-pitch-mode)

(setq rustic-lsp-server 'rust-analyzer)

(add-hook 'rust-mode-hook #'racer-mode)

(define-derived-mode genehack-vue-mode web-mode "ghVue"
  "A major mode derived from web-mode, for editing .vue files with LSP support.")

(require 'eglot)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . genehack-vue-mode))
(add-hook 'genehack-vue-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))

(setq +latex-viewers '(zathura pdf-tools evince okular skim sumatrapdf))
(add-hook 'LaTeX-mode-hook #'mixed-pitch-mode)

(setq tec/yas-latex-template-preamble "
<<latex-nice-preable>>
")

(defun tec/yas-latex-get-class-choice ()
  "Prompt user for LaTeX class choice"
  (setq tec/yas-latex-class-choice (ivy-read "Select document class: " '("article" "scrartcl" "bmc") :def "bmc")))

(defun tec/yas-latex-preamble-if ()
  "Based on class choice prompt for insertion of default preamble"
  (if (equal tec/yas-latex-class-choice "bmc") 'nil
    (eq (read-char-choice "Include default preamble? [Type y/n]" '(?y ?n)) ?y)))

(map!  :map LaTeX-mode-map
       :i "TAB" 'cdlatex-tab
       )

(add-hook 'LaTeX-mode-hook (lambda () (yas-minor-mode -1)))
(add-hook 'LaTeX-mode-hook #'auto-fill-mode)

(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case 'keep-prefix)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

(add-to-list 'company-backends 'company-dabbrev)
(add-to-list 'company-backends 'company-dabbrev-code)
(add-to-list 'company-backends 'company-yasnippet)
(add-to-list 'company-backends 'company-capf)
(add-to-list 'company-backends 'company-keywords)
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

(add-hook 'helpful-mode-hook #'mixed-pitch-mode)

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

(add-hook 'elfeed-show-mode-hook #'mixed-pitch-mode)

(when EMACS28+
  (add-hook 'latex-mode-hook #'TeX-latex-mode))
