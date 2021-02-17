;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Robin Strudel"
      user-mail-address "robin.strudel@inria.fr")

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
(setq doom-font (font-spec :family "Source Code Pro" :size 13 :weight 'normal :width 'normal))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/code/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

;; SPC SPC for counsel
(map! :leader
      :desc "Open like spacemacs" "SPC" #'counsel-M-x)

;; Buffers
(map! :leader "TAB" #'evil-switch-to-windows-last-buffer)

;; Auto-completion
(after! company (setq company-idle-delay 0.1))

;; Multiple cursors
(map! :leader
      (:prefix ("s" . "search")
        :desc "Match all occurences" "e" #'evil-multiedit-match-all))

;; Treemacs
(map! :leader (:prefix ("p" . "project")
               :desc "Open treemacs" "t" #'treemacs))

;; Copy/paste buffer
(map! :leader (:prefix ("r" . "helm")
               :desc "Show kill ring" "y" #'helm-show-kill-ring))

;; Avy jump
(map! :leader
      (:prefix ("j" . "jump")
        "i" 'imenu
        "b" 'avy-pop-mark
        "j" 'evil-avy-goto-char-timer
        "l" 'evil-avy-goto-line
        "u" 'spacemacs/avy-goto-url
        "U" 'spacemacs/avy-open-url
        "w" 'evil-avy-goto-word-or-subword-1
        "o" 'spacemacs/avy-open-url))

;; TODO fix window-p error
;; Balance windows
;; (dolist (fn '(split-window-right split-window-below delete-window))
;;   (advice-add fn :after #'balance-windows))


;; Layers tweaks
(load! "python.el")
(load! "git.el")

;; Show error message
(setq debug-on-error '(wrong-type-argument))

;;; config.el ends here
