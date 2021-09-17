;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Frank Xiao"
      user-mail-address "frankyaoxiao@gmail.com")

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
(setq doom-font (font-spec :family "Sauce Code Pro Nerd Font" :size 30 ))
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)
;; (setq doom-font (font-spec :size 15))


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

;; Make autocomplete better
(setq company-idle-delay 0
      company-minimum-prefix-length 1)
;; Less jerky scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(good-scroll-mode 1)

;; Discord rich presence integration
(elcord-mode)

;; Add some extra keywords for org-mode
(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("WAITING" :foreground "#9f7efe" :weight bold)
          ("INPROGRESS" :foreground "#0098dd" :weight bold)
          ("CANCELLED" :foreground "#ff6480" :weight bold))
        ))

;;; Music Player Settings (emms)
(emms-all)
(emms-default-players)
(emms-mode-line 1)
(emms-playing-time 1)
(setq emms-source-file-default-directory "~/Music/"
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(map! :leader
      (:prefix ("a" . "EMMS audio player")
       :desc "Open Emms" "r" #'emms
       :desc "Change Directory" "d" #'emms-play-directory
       :desc "Emms pause track" "x" #'emms-pause
       :desc "Emms play previous track" "p" #'emms-previous
       :desc "Emms play next track" "n" #'emms-next
       :desc "Emms seek" "s" #'emms-seek))


;; Org Mode Settings
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                        (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(add-hook 'org-mode-hook 'visual-line-mode)
(custom-theme-set-faces
'user
'(org-block ((t (:inherit fixed-pitch))))
'(org-code ((t (:inherit (shadow fixed-pitch)))))
'(org-document-info ((t (:foreground "dark orange"))))
'(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
'(org-indent ((t (:inherit (org-hide fixed-pitch)))))
'(org-link ((t (:foreground "royal blue" :underline t))))
'(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
'(org-property-value ((t (:inherit fixed-pitch))) t)
'(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
'(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
'(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
'(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

