(setq user-full-name "Hyper4Saken"
      user-mail-address "hyper4saken@protonmail.com")

;;fonts
(setq doom-font (font-spec :family "JetBrains Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 20)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; theme
;;(setq doom-theme 'doom-henna)
;;(setq doom-theme 'doom-tomorrow-night)
;;(setq doom-theme 'doom-tokyo-night)
(setq doom-theme 'doom-ayu-dark)

; relative number
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "/mnt/Backup/Org/"
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("❂" "✪" "❆" "◉" "○" "●" "◆")
        org-superstar-itembullet-alist '((?+ . ?✠) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

(after! org
  (setq org-roam-directory "/mnt/Backup/Org/roam/"
        org-roam-graph-viewer "/usr/bin/brave"))

(map! :leader
      (:prefix ("n r" . "org-roam")
       :desc "Completion at point" "c" #'completion-at-point
       :desc "Find node"           "f" #'org-roam-node-find
       :desc "Show graph"          "g" #'org-roam-graph
       :desc "Insert node"         "i" #'org-roam-node-insert
       :desc "Capture to node"     "n" #'org-roam-capture
       :desc "Toggle roam buffer"  "r" #'org-roam-buffer-toggle))

;; org-headers font size
(custom-theme-set-faces
     'user
     `(org-level-4 ((t ( :height 1.2))))
     `(org-level-3 ((t ( :height 1.5))))
     `(org-level-2 ((t ( :height 1.8))))
     `(org-level-1 ((t ( :height 2.00))))
     )

(xterm-mouse-mode 1)

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(doom-themes-neotree-config)
;;(after! doom-themes-neotree-config
(setq doom-themes-neotree-file-icons t
   doom-neotree-enable-variable-pitch t)
;;)
(map! :leader
      :desc "Toggle neotree file viewer" "t n" #'neotree-toggle
      :desc "Open directory in neotree"  "d n" #'neotree-dir)

(set-face-attribute 'mode-line nil :font "Ubuntu Mono-15")
(setq doom-modeline-height 30     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name to modeline
      doom-modeline-persp-icon t   ;; adds folder icon next to persp name
      doom-modeline-major-mode-icon t  ;; if icons failed major icons selected
      doom-modeline--buffer-file-state-icon t)  ;;show icon in bufferline

;; tabs with icons
(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•")
(map! :leader
      :desc "Toggle tabs globally" "t c" #'centaur-tabs-mode
      :desc "Toggle tabs local display" "t C" #'centaur-tabs-local-mode)
(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                               (kbd "g <down>")  'centaur-tabs-forward-group
                                               (kbd "g <up>")    'centaur-tabs-backward-group)

;; enable emojify mode in gloabl
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; custom key bindinds for comment and relative line number
(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers"            "l" #'doom/toggle-line-numbers
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines"          "t" #'toggle-truncate-lines))

;; calendar config and dates
(defun hyper/insert-todays-date (prefix)
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%A, %B %d, %Y")
                 ((equal prefix '(4)) "%m-%d-%Y")
                 ((equal prefix '(16)) "%Y-%m-%d"))))
    (insert (format-time-string format))))

(require 'calendar)
(defun hyper/insert-any-date (date)
  "Insert DATE using the current locale."
  (interactive (list (calendar-read-date)))
  (insert (calendar-date-string date)))

(map! :leader
      (:prefix ("i d" . "Insert date")
        :desc "Insert any date"    "a" #'hyper/insert-any-date
        :desc "Insert todays date" "t" #'hyper/insert-todays-date))

;; markdown
(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2)))))

;; org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;;terminal
(setq shell-file-name "/bin/zsh"
      vterm-max-scrollback 5000)
(setq eshell-rc-script "~/.config/doom/eshell/profile"
      eshell-aliases-file "~/.config/doom/eshell/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))
(map! :leader
      :desc "Eshell"                 "e s" #'eshell
      :desc "Eshell popup toggle"    "e t" #'+eshell/toggle
      :desc "Counsel eshell history" "e h" #'counsel-esh-history
      :desc "Vterm popup toggle"     "v t" #'+vterm/toggle)

;;org-download
;;This extension facilitates moving images from browser filesystems
(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
;; Screen captured is saved on particular folder
(after! org-download
  (setq-default org-download-image-dir "/mnt/Backup/Org/notes_images"))
;; custom keybinding for org-download
(map! :leader
      (:prefix ("i v" . "Org Download Mode")
        :desc "Paste Image"    "a" #'org-download-clipboard
        :desc "Screen Capture" "s" #'org-download-screenshot))
