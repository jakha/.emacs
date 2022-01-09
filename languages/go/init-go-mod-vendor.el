(defun goja-mod-vendor ()
  "."
  (interactive)
  (spinner-start 'progress-bar-filled)
  (let ((go-mod-vendor-proc (start-process
					  "go-mod-vendor"
					  nil
					  "go"
					  "mod"
					  "vendor")))
	(set-process-sentinel go-mod-vendor-proc (lambda (proc data)
										(when (not (process-live-p proc))
										  (spinner-stop))))
	(set-process-filter go-mod-vendor-proc (lambda (proc data)
											 (message data)))))
