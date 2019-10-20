(defpackage ltk-workshop
  (:use :cl :ltk))

(in-package :ltk-workshop)

;; a simple example (grabbed from documentation for illustration)
(defun hello-ltk (window-title)
    (ltk:with-ltk ()
      (let ((b (make-instance 'ltk:button
			      :master nil
			      :text "Exit"
			      :command (lambda ()
					 (return-from hello-ltk nil)))))
      (ltk:wm-title ltk:*tk* window-title)
      (ltk:pack b :padx 500 :pady 500))))

(defun frame-example ()
  (ltk:with-ltk ()
    (let* ((f (make-instance 'ltk:frame))
	   (b1 (make-instance 'ltk:button
			      :master f
			      :text "Button 1"
			      :command (lambda () (format t "Button 1 Pressed~&"))))
	   (b2 (make-instance 'ltk:button
			      :master f
			      :text "Exit"
			      :command (lambda ()
					 (format t "Exit Button Pressed. Exiting Application~%")
					 (return-from frame-example nil)))))
      (ltk:pack f)
      (ltk:pack b1 :side :left :padx 30 :pady 5)
      (ltk:pack b2 :side :left)
      (ltk:configure f :borderwidth 3 :relief :sunken))))

(defun grid-example ()
  (ltk:with-ltk ()
    (let* ((f (make-instance 'ltk:frame))
	   (sp (make-instance 'ltk:spinbox
			      :master f
			      :text "Current Count"
			      :from 1
			      :to 10
			      :command (lambda (value)
					 (format t "~A~&" value))
			      :name "example")))
      (ltk:grid f 0 0
		:sticky :n
		:padx 3
		:pady 3
		:rowspan 3)
      (ltk:grid sp 1 2 :sticky :e))))

;; simple drawing application
(defun draw-oval (canvas evt down)
  		  (when down
		    (ltk:create-oval canvas
				     (- (event-x evt) 10) (- (event-y evt) 10)
				     (+ (event-x evt) 10) (+ (event-y evt) 10))))
(defun scribble ()
  (ltk:with-ltk ()
    (let* ((canvas (make-instance 'ltk:canvas))
	   (down nil))
      (ltk:pack canvas)n
      (ltk:bind canvas "<ButtonPress-1>"
		(lambda (evt)
		  (setf down t)
		  (ltk:create-oval canvas
				   (- (event-x evt) 10) (- (event-y evt) 10)
				   (+ (event-x evt) 10) (+ (event-y evt) 10))))
      (ltk:bind canvas "<ButtonRelease-1>"
		(lambda (evt)
		  (declare (ignore evt))
		  (setf down nil)))
      (ltk:bind canvas "<Motion>"
		(lambda (evt)
		  (funcall #'draw-oval canvas evt down))))))

