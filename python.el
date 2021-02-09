;;; python.el -*- lexical-binding: t; -*-

;; Python

;; Conda
(after! conda (setq conda-anaconda-home "/home/rstrudel/miniconda3/"
                    conda-env-autoactivate-mode t))
;;get current environment--from environment variable CONDA_DEFAULT_ENV
(conda-env-activate "segtr")
;;(conda-env-autoactivate-mode t)
(setq-default mode-line-format (cons mode-line-format '(:exec conda-env-current-name)))

;; Virtual environment
;; (setenv "WORKON_HOME" "/home/rstrudel/miniconda3/envs/")
;; (map! :leader (:prefix ("v" . "venv") "w" #'pyvenv-workon))
;; (map! :leader (:prefix ("v" . "venv") "a" #'pyvenv-activate))
;; (map! :leader (:prefix ("v" . "venv") "d" #'pyvenv-deactivate))

;; Add breakpoint
(defun python-toggle-breakpoint ()
  "Add a break point, highlight it."
  (interactive)
  (let ((trace "import pudb; pudb.set_trace()")
        (line (thing-at-point 'line)))
    (if (and line (string-match trace line))
        (kill-whole-line)
      (progn
        (back-to-indentation)
        (insert trace)
        (insert "\n")
        (python-indent-line)))))
(map! :leader "mdb" #'python-toggle-breakpoint)

;; Black formatting
(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)
;; Feel free to throw your own personal keybindings here
(map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
(map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
(map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)

;;; python.el ends here
