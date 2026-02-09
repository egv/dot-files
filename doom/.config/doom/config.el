;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
(setq doom-font                (font-spec :family "JetBrainsMono Nerd Font Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Inter"          :size 18)
      doom-big-font            (font-spec :family "JetBrainsMono Nerd Font Mono" :size 26))
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq catppuccin-flavor 'macchiato)

;; Terminal Emacs: do not paint backgrounds, trust terminal palette
(when (not (display-graphic-p))
  ;; Main background
  (set-face-attribute 'default nil :background "unspecified-bg")

  ;; Remove Doom UI background blocks
  (dolist (face '(fringe
                  mode-line
                  mode-line-inactive
                  header-line
                  vertical-border
                  region))
    (set-face-attribute face nil :background "unspecified-bg" :box nil))
  (setq term-file-aliases nil)
  (setq frame-background-mode 'dark))

(setq doom-sync-enable nil)
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Disable all quit confirmations
(setq confirm-kill-emacs nil)

;; Disable menu bar in terminal frames
(unless (display-graphic-p)
  (menu-bar-mode -1))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(use-package! reverse-im
  :config
  (reverse-im-activate "russian-computer"))

(use-package! inheritenv
  :defer t)
(use-package! websocket
  :defer t)
(use-package! eat
  :commands (eat)
  :config)
(use-package! monet
  :after websocket
  :commands (monet-mode monet-start-server)
  :config
  (monet-mode 1))

(use-package! claude-code
  :after (eat monet inheritenv)
  :commands (claude-code
             claude-code-transient
             claude-code-toggle
             claude-code-send-command
             claude-code-switch-to-buffer)
  :config
  (setq claude-code-set-terminal-backend 'eat)
  (add-hook 'claude-code-process-environment-functions
            #'monet-start-server-function)
  (claude-code-mode 1))

(map! :leader
      (:prefix-map ("a" . "AI")
      ;; Claude Code prefix
      (:prefix-map ("c" . "Claude Code")
                   :desc "Claude transient menu"   "c" #'claude-code-transient
                   :desc "Start Claude in project" "s" #'claude-code
                   :desc "Send command"            "x" #'claude-code-send-command
                   :desc "Toggle Claude window"    "t" #'claude-code-toggle
                   :desc "Switch to Claude buffer" "b" #'claude-code-switch-to-buffer)

      ;; Monet prefix
      (:prefix-map ("m" . "Monet")
                   :desc "Toggle Monet mode"       "m" #'monet-mode
                   :desc "Start Monet server"      "s" #'monet-start-server)))

(map! :leader
      (:prefix-map ("o" . "Open")
                   :desc "EAT terminal"            "t" #'eat))
