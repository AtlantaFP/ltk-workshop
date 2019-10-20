#|
  This file is a part of ltk-workshop project.
|#

(defsystem "ltk-workshop-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("ltk-workshop"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "ltk-workshop"))))
  :description "Test system for ltk-workshop"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
