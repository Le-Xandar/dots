;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/gtd/")
;; (setq org-capture-templates '(("t" "Todo [inbox]" entry
;;                                (file+headline "~/Documents/gtd/inbox.org" "Tasks")
;;                                "* TODO %i%?")
;;                               ("T" "Tickler" entry
;;                                (file+headline "~/Documents/gtd/tickler.org" "Tickler")
;;                                "* %i%? \n %U")))

;; (setq org-agenda-files '("~/Documents/gtd/inbox.org"
;;                          "~/Documents/gtd/gtd.org"
;;                          "~/Documents/gtd/tickler.org"))

;; (setq org-refile-targets '(("~/Documents/gtd/gtd.org" :maxlevel . 3)
;;                            ("~/Documents/gtd/someday.org" :level . 1)
;;                            ("~/Documents/gtd/tickler.org" :maxlevel . 2)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
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


;; Rust analyazer
(setq rustic-lsp-server 'rust-analyzer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1b1d1e" "#ff5d38" "#98be65" "#bcd42a" "#51afef" "#c678dd" "#46D9FF" "#ede0ce"])
 '(custom-safe-themes
   '("1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "6177ecbffb8f37756012c9ee9fd73fc043520836d254397566e37c6204118852" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "82360e5f96244ce8cc6e765eeebe7788c2c5f3aeb96c1a765629c5c7937c0b5b" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "0cb1b0ea66b145ad9b9e34c850ea8e842c4c4c83abe04e37455a1ef4cc5b8791" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "a92e9da0fab90cbec4af4a2035602208cebf3d071ea547157b2bfc5d9bd4d48d" "425cf02839fa7c5ebd6cb11f8074f6b8463ae6ed3eeb4cf5a2b18ffc33383b0b" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "9f15d03580b08dae41a1e5c1f00d1f1aa99fea121ca32c28e2abec9563c6e32c" "25f1b2ace87d23d803b42267fafdc38b31472e444c2aaa9069aa2c06be8955b2" "9b272154fb77a926f52f2756ed5872877ad8d73d018a426d44c6083d1ed972b1" "632694fd8a835e85bcc8b7bb5c1df1a0164689bc6009864faed38a9142b97057" "3d3807f1070bb91a68d6638a708ee09e63c0825ad21809c87138e676a60bda5d" "912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" default))
 '(elfeed-feeds
   '("https://andreyorst.gitlab.io/feed.xml" "https://ideaman924.com/feed.xml" "https://brettgilio.ml/rss.xml" "https://videos.lukesmith.xyz/feeds/videos.xml?videoChannelId=2"))
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
