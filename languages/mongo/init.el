(add-to-list 'load-path (concat (getenv "MONGO_MODE_HOME") "/mongo-mode"))

(use-package mongo
  :ensure t)

(require 'mongo)
