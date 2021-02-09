;;; git.el -*- lexical-binding: t; -*-

;; pop new vertical window for magit status
(defun magit-split ()
  (interactive)
  (progn
  (split-window-horizontally)
  (other-window 1)
  (magit-status)
  (balance-windows)))

(defun git-link-copy-url-only ()
  "Only copy the generated link to the kill ring."
  (interactive)
  (let (git-link-open-in-browser)
    (call-interactively 'git-link)))

(map! :leader
      (:prefix ("g" . "git")
        :desc "Magit status" "s" #'magit-split
        :desc "Git link in browser" "ll" #'git-link
        :desc "Git copy link" "lL" #'git-link-copy-url-only))

;; default is to open the generated link
(setq git-link-open-in-browser t)

;;; git.el ends here
