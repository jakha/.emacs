(add-hook 'sql-mode-hook 'lsp)
(setq lsp-sqls-server "/home/jaha/go/bin/sqls")
(setq lsp-sqls-workspace-config-path nil)

(setq lsp-sqls-connections
    '(((driver . "mysql") (dataSourceName . "root:password@tcp(dereshov.debex.ru:30100)?parseTime=true"))))

