
(global-set-key "" 'electric-buffer-list)
(global-set-key "" 'delete-blank-lines)

; coming from package-manager
;(autoload 'groovy-mode "groovy-mode-winder" "Groovy editing mode." t)
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

