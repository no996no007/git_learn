
(cl:in-package :asdf)

(defsystem "referee_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Apriltag_info" :depends-on ("_package_Apriltag_info"))
    (:file "_package_Apriltag_info" :depends-on ("_package"))
  ))