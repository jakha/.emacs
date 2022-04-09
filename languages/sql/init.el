(setq sql-connection-alist
      '((ereshov-dev (sql-product 'mysql)
                   (sql-port 30100)
                   (sql-server "dereshov.debex.ru")
                   (sql-user "root")
                   (sql-password "password")
                   (sql-database ""))))

(require 'ejc-sql)
(add-hook 'sql-mode-hook 'sqlind-minor-mode)

(use-package  ejc-sql
  :ensure t)

;; MySQL example
(ejc-create-connection
 "MySQL-db-connection"
 :classpath (concat "~/.m2/repository/mysql/mysql-connector-java/5.1.6/"
                     "mysql-connector-java-5.1.6.jar")
 :subprotocol "mysql"
 :subname "//dereshov.debex.ru:30100/"
 :user "root"
 :password "password")

(setq ejc-use-flx t)

(require 'ejc-company)
(push 'ejc-company-backend company-backends)
(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (company-mode t)))

(setq ejc-complete-on-dot t)
