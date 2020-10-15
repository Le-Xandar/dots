;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Westofer Raymond"
      user-mail-address "WestoferRaymond@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 11))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/gtd/")
(setq display-line-numbers-type 'relative)


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
;;
;;==============================================
;;             Global key binds
;;==============================================
(map!
 :n "<f6>" 'elfeed
 ;; :n "<f7>" email TODO: Add email
 "C-h" 'backward-delete-char-untabify
 )


;; Rust analyazer
(setq rustic-lsp-server 'rust-analyzer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1b1d1e" "#ff5d38" "#98be65" "#bcd42a" "#51afef" "#c678dd" "#46D9FF" "#ede0ce"])
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#2b2a27" "#ff5d38"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#2b2a27" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#2b2a27" "#3f444a"))
 '(objed-cursor-color "#ff5d38")
 '(pdf-view-midnight-colors (cons "#ede0ce" "#2b2a27"))
 '(rustic-ansi-faces
   ["#2b2a27" "#ff5d38" "#98be65" "#bcd42a" "#51afef" "#c678dd" "#46D9FF" "#ede0ce"])
 '(vc-annotate-background "#2b2a27")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#a4c551")
    (cons 60 "#b0cc3d")
    (cons 80 "#bcd42a")
    (cons 100 "#c1a623")
    (cons 120 "#c5781c")
    (cons 140 "#cb4b16")
    (cons 160 "#c95a58")
    (cons 180 "#c7699a")
    (cons 200 "#c678dd")
    (cons 220 "#d96fa6")
    (cons 240 "#ec666f")
    (cons 260 "#ff5d38")
    (cons 280 "#cf563c")
    (cons 300 "#9f5041")
    (cons 320 "#6f4a45")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; =====
;; company
;; =====
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)


;;npm install -g vue-language-server
;; (setq vue-mode-packages
;;   '(vue-mode))

;; (setq vue-mode-excluded-packages '())

;; (defun vue-mode/init-vue-mode ()
;;   "Initialize my package"
;;   (use-package vue-mode))
(define-derived-mode genehack-vue-mode web-mode "ghVue"
  "A major mode derived from web-mode, for editing .vue files with LSP support.")

;;https://genehack.blog/2020/08/web-mode-eglot-vetur-vuejs-=-happy/
(require 'eglot)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . genehack-vue-mode))
(add-hook 'genehack-vue-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))



;; =====
;; org mode
;; =====
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(defun update-org-latex-fragments ()
  (org-latex-preview '(64))
  (plist-put org-format-latex-options :scale text-scale-mode-amount)
  (org-latex-preview '(16)))
(add-hook 'text-scale-mode-hook 'update-org-latex-fragments)


'(org-format-latex-options
  (quote
   (:foreground default :background default :scale 0.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
    ("begin" "$1" "$" "$$" "\\(" "\\["))))
(set-default 'preview-scale-function 0.2)




;; =====
;; Rust
;; =====
;; $ rustup toolchain add nightly
;; $ rustup component add rust-src
;; $ cargo +nightly install racer
(add-hook 'rust-mode-hook #'racer-mode)


;; =========
;; Neotree
;; =========
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; ================
;; LaTeX
;; ================
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (TeX-fold-mode 1)
            (add-hook 'find-file-hook 'TeX-fold-buffer t t)
            (add-hook 'after-change-functions
                      (lambda (start end oldlen)
                        (when (= (- end start) 1)
                          (let ((char-point
                                 (buffer-substring-no-properties
                                  start end)))
                            (when (or (string= char-point "}")
                                      (string= char-point "$"))
                              (TeX-fold-paragraph)))))
                      t t)))
(add-hook 'TeX-mode-hook #'TeX-fold-mode)



;; ===========================
;; Compile on save
;; ===========================

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


;; el-feed
(elfeed-org)
(setq rmh-elfeed-org-files (list "~/.doom.d/elfeed.org"))
(require 'elfeed)

(defun elfeed-v-mpv (url)
  "Watch a video from URL in MPV"
  (defvar cmd (format "mpv --ytdl-format=worst  '%s'" url))
(save-window-excursion
  (async-shell-command cmd))
(save-window-excursion
  (async-shell-command "notify-send 'Loading Video' "))
  )
(message "Video Loading")

(require 'elfeed)
(defun elfeed-view-mpv (&optional use-generic-p)
  "Youtube-feed link"
  (interactive "P")
  (let ((entries (elfeed-search-selected)))
    (cl-loop for entry in entries
             do (elfeed-untag entry 'unread)
             when (elfeed-entry-link entry)
             do (elfeed-v-mpv it))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(define-key elfeed-search-mode-map  "v"  'elfeed-view-mpv)
(setq-default elfeed-search-filter "@1-week-ago")


;; closing elfeed forwards to homepage
(defun elfeed-close-prev-buffer ()
  (interactive)
  "elfeed kill and restore prev buffer"
  (elfeed-kill-buffer)
   (previous-buffer))


(map!  :map elfeed-search-mode-map
       :n "v" 'elfeed-view-mpv
       :n "R" 'elfeed-update
       :n "G" 'evil-goto-line
       :n "<f6>" 'elfeed-close-prev-buffer
       :n "b" 'elfeed-search-browse-url
       :n "c" 'elfeed-search-clear-filter
       )
