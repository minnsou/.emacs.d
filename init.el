;-------------------------------------
; packages
;-------------------------------------
;; package管理
;; パッケージを使わないときは以下をコメントアウト
;; ################### ここから #####################
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
;; ロードパスの追加
(add-to-list 'load-path "~/.emacs.d/elpa")
;; ################### ここまで #####################


;-------------------------------------
; File/Buffer Complement
;-------------------------------------
;; (1)ivyを使用
;; (ivy-mode 1)
;; (counsel-mode 1)
;; (2)ido-modeを使用
(ido-mode t)
(ido-everywhere 1)
;; idoの中間/曖昧一致
(setq ido-enable-flex-matching t)
;; パッケージを使わないときは以下をコメントアウト
;; ################### ここから #####################
;; idoの垂直表示
(require 'ido-vertical-mode)
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;; M-xなどでもidoを使用
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
;; ################### ここまで #####################


;-------------------------------------
; Code Complement
;-------------------------------------
;; (1) auto-completeを使用
;;(require 'auto-complete-config)
;;(global-auto-complete-mode t)
;;fuzzyを使った曖昧検索
;; (require 'fuzzy)
;; (setq ac-use-fuzzy t)
;; C-n, C-pで補完候補検索
;(setq ac-use-menu-map t)
;(define-key ac-menu-map "RET" 'ac-complete)
;; (2) company-modeを使用
;; オフライン時は以下をコメントアウト
;; ################### ここから #####################
(require 'company)
(global-company-mode)
(setq company-selection-wrap-around t)
;; 補完を表示する最小文字数
(setq company-minimum-prefix-length 2)
;; キーバインドの変更
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)
;; ################### ここまで #####################
;; カラーの変更
;; (set-face-attribute 'company-tooltip nil
;;                     :foreground "black" :background "lightgrey")
;; (set-face-attribute 'company-tooltip-common nil
;;                     :foreground "black" :background "lightgrey")
;; (set-face-attribute 'company-tooltip-common-selection nil
;;                     :foreground "white" :background "steelblue")
;; (set-face-attribute 'company-tooltip-selection nil
;;                     :foreground "black" :background "steelblue")
;; (set-face-attribute 'company-preview-common nil
;;                     :background nil :foreground "lightgrey" :underline t)
;; (set-face-attribute 'company-scrollbar-fg nil
;;                     :background "orange")
;; (set-face-attribute 'company-scrollbar-bg nil
;;                     :background "gray40")
;; pythonコード補完としてcompany-jediの使用
;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (add-hook 'python-mode-hook 'my/python-mode-hook)


;-------------------------------------
; keybind
;-------------------------------------
;; C-hをbackspaceにする
;(global-set-key "\C-h" 'delete-backward-char) ;これはミニバッファだとだめ
(define-key key-translation-map [?\C-h] [?\C-?])
;; C-hだったhelpをC-c C-hにする
(global-set-key "\C-c\C-h" 'help-command)
;; C-x oに加えてC-tも追加(window operation) 
;(global-set-key "\C-t" 'other-window)


;-------------------------------------
; frame
;-------------------------------------
;; 行番号の表示(emacsバージョンによって変える)
(if (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode)
    (global-linum-mode t))
;; 列番号の表示
;(column-number-mode t)
;; スペース、タブなどを可視化
;(global-whitespace-mode 1)
;; タイトルにフルパス表示
(setq frame-title-format "%f")
;; current directory表示
(let ((ls (member 'mode-line-buffer-identification mode-line-format)))
  (setcdr ls (cons '(:eval (concat " (" (abbreviate-file-name default-directory)")"))
    (cdr ls))))
;; 対応する括弧を光らせる
(show-paren-mode 1)
;; カーソル行をハイライトする
(defface my-hl-line-face
  '((((class color) (background dark))
     (:background "brightyellow" t))
    (((class color) (background light))
     (:background "#202020" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)
;; ファイルサイズの表示
(size-indication-mode t)
;; 曜日・月・日、時刻を表示
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)
;; バッテリー残量を表示
(display-battery-mode t)
;; メニューバーを消す
;(menu-bar-mode -1)
;; 画像ファイルを表示
(auto-image-file-mode t)


;--------------------------------------
; others
;--------------------------------------
;; 1行ごとの改ページ
(setq scroll-conservatively 1)
;; 括弧を自動で補完する
;(electric-pair-mode 1)
;; tabにスペース４つを利用
(setq-default tab-width 4 indent-tabs-mode nil)
;; バックアップファイルとオートセーブファイルは~/.emacs.d/backupsへ
(add-to-list 'backup-directory-alist
   (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))
;; スペルチェック
;; (setq-default flyspell-mode t)
;; (setq ispell-dictionary "american")


;-------------------------------------
; for Mac OS
;-------------------------------------
;; utf-8を使う
(prefer-coding-system 'utf-8)
;; キルリングに追加されたものをクリップボードに追加する
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
;; クリップボードに追加されたものをキルリングに追加する
;(defun copy-from-osx ()
;(shell-command-to-string "pbpaste"))
;(setq interprogram-paste-function 'copy-from-osx)


;-------------------------------------
; Custom set variables
;-------------------------------------
;; パッケージを使わないときは以下をコメントアウト
;; ################### ここから #####################
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-jedi jedi ido-completing-read+ fuzzy counsel ido-vertical-mode company auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ################### ここまで #####################
