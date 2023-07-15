;; Auto-generated. Do not edit!


(when (boundp 'referee_msgs::Apriltag_info)
  (if (not (find-package "REFEREE_MSGS"))
    (make-package "REFEREE_MSGS"))
  (shadow 'Apriltag_info (find-package "REFEREE_MSGS")))
(unless (find-package "REFEREE_MSGS::APRILTAG_INFO")
  (make-package "REFEREE_MSGS::APRILTAG_INFO"))

(in-package "ROS")
;;//! \htmlinclude Apriltag_info.msg.html


(defclass referee_msgs::Apriltag_info
  :super ros::object
  :slots (_tag_num _tag_pos_x _tag_pos_y _tag_pos_z ))

(defmethod referee_msgs::Apriltag_info
  (:init
   (&key
    ((:tag_num __tag_num) 0)
    ((:tag_pos_x __tag_pos_x) 0.0)
    ((:tag_pos_y __tag_pos_y) 0.0)
    ((:tag_pos_z __tag_pos_z) 0.0)
    )
   (send-super :init)
   (setq _tag_num (round __tag_num))
   (setq _tag_pos_x (float __tag_pos_x))
   (setq _tag_pos_y (float __tag_pos_y))
   (setq _tag_pos_z (float __tag_pos_z))
   self)
  (:tag_num
   (&optional __tag_num)
   (if __tag_num (setq _tag_num __tag_num)) _tag_num)
  (:tag_pos_x
   (&optional __tag_pos_x)
   (if __tag_pos_x (setq _tag_pos_x __tag_pos_x)) _tag_pos_x)
  (:tag_pos_y
   (&optional __tag_pos_y)
   (if __tag_pos_y (setq _tag_pos_y __tag_pos_y)) _tag_pos_y)
  (:tag_pos_z
   (&optional __tag_pos_z)
   (if __tag_pos_z (setq _tag_pos_z __tag_pos_z)) _tag_pos_z)
  (:serialization-length
   ()
   (+
    ;; int8 _tag_num
    1
    ;; float32 _tag_pos_x
    4
    ;; float32 _tag_pos_y
    4
    ;; float32 _tag_pos_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _tag_num
       (write-byte _tag_num s)
     ;; float32 _tag_pos_x
       (sys::poke _tag_pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tag_pos_y
       (sys::poke _tag_pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tag_pos_z
       (sys::poke _tag_pos_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _tag_num
     (setq _tag_num (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tag_num 127) (setq _tag_num (- _tag_num 256)))
   ;; float32 _tag_pos_x
     (setq _tag_pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tag_pos_y
     (setq _tag_pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tag_pos_z
     (setq _tag_pos_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get referee_msgs::Apriltag_info :md5sum-) "2d3ba812331b080d7cb19d457f299caf")
(setf (get referee_msgs::Apriltag_info :datatype-) "referee_msgs/Apriltag_info")
(setf (get referee_msgs::Apriltag_info :definition-)
      "int8 tag_num
float32 tag_pos_x
float32 tag_pos_y
float32 tag_pos_z
")



(provide :referee_msgs/Apriltag_info "2d3ba812331b080d7cb19d457f299caf")


