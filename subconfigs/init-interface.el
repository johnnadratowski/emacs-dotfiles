;; no fringes or scrollbars
    (set-fringe-mode -1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1)

;; enable the column fill mark, globally
    (define-globalized-minor-mode global-fci-mode
      fci-mode (
                lambda () (fci-mode 1)))
    (global-fci-mode 1)

;; (require 'linum-relative)
    ;; (after 'linum
    ;;   (ac-linum-workaround))
    ;; (global-linum-mode nil)

;; ediff: side-by-side diffs
    (setq ediff-split-window-function 'split-window-horizontally
          ediff-window-setup-function 'ediff-setup-windows-plain) ;; no extra frames

;; ido-mode
    (require 'ido)
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
    (ido-mode t)

;; IDE-like GDB
    (setq gdb-many-windows t)

;; highlight tail, stupid but awesome => disabled, problems in Windows
    ;; (require-package 'highlight-tail)
    ;; (highlight-tail-mode)
    ;; (setq highlight-tail-steps 30
    ;;       highlight-tail-timer 0.025)


;; y or n is enough
    (defalias 'yes-or-no-p 'y-or-n-p)


;; some more interface-related settings
    (setq
          ring-bell-function (lambda () ())
          read-file-name-completion-ignore-case t
          frame-title-format '("Emacs @ : %b %+%+ %f")
          mouse-yank-at-point t
          inhibit-splash-screen t
          inhibit-startup-echo-area-message t
          inhibit-startup-message t
    )
(blink-cursor-mode -1)

;; non jumpy scrolling => this is really laggy, disabled
    ;; (require 'smooth-scroll)
    ;; (smooth-scroll-mode t)
    ;; (setq smooth-scroll/vscroll-step-size 8)
    ;; (setq scroll-margin 5
    ;; (setq linum-delay t)
    ;; scroll-conservatively 9999
    ;; scroll-step 1)

;; better buffer names for duplicates
    (require 'uniquify)
    (setq uniquify-buffer-name-style 'forward
          uniquify-separator "/"
          uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
          uniquify-after-kill-buffer-p t)

;; dont clutter the modeline bar with minor modes indicators
    (require-package 'diminish)
    (diminish 'visual-line-mode)
    (after 'autopair (diminish 'autopair-mode))
    (after 'undo-tree (diminish 'undo-tree-mode))
    (after 'auto-complete (diminish 'auto-complete-mode))
    (after 'projectile (diminish 'projectile-mode))
    (after 'yasnippet (diminish 'yas-minor-mode))
    (after 'guide-key (diminish 'guide-key-mode))
    (after 'eldoc (diminish 'eldoc-mode))
    (after 'smartparens (diminish 'smartparens-mode))
    (after 'company (diminish 'company-mode))
    (after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
    (after 'git-gutter+ (diminish 'git-gutter+-mode))
    (after 'magit (diminish 'magit-auto-revert-mode))
    (after 'hs-minor-mode (diminish 'hs-minor-mode))

;; open a windows explorer on the buffer path
    (defun open-explorer-path ()
      (interactive)
      (shell-command
       (concat "explorer "
               (replace-regexp-in-string "/" "\\"
                                         (file-name-directory
                                          (buffer-file-name)) t t))))

(provide 'init-interface)
