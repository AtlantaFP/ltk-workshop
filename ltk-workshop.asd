#|
  This file is a part of ltk-workshop project.
|#

#|
  A simple workshop on LTK for Atlanta Functional Programming
|#

(defsystem "ltk-workshop"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("ltk")
  :components ((:module "src"
                :components
                ((:file "ltk-workshop"))))
  :description "A simple workshop on LTK for Atlanta Functional Programming"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "ltk-workshop-test"))))
