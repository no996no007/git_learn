; Auto-generated. Do not edit!


(cl:in-package referee_msgs-msg)


;//! \htmlinclude Apriltag_info.msg.html

(cl:defclass <Apriltag_info> (roslisp-msg-protocol:ros-message)
  ((tag_num
    :reader tag_num
    :initarg :tag_num
    :type cl:fixnum
    :initform 0)
   (tag_pos_x
    :reader tag_pos_x
    :initarg :tag_pos_x
    :type cl:float
    :initform 0.0)
   (tag_pos_y
    :reader tag_pos_y
    :initarg :tag_pos_y
    :type cl:float
    :initform 0.0)
   (tag_pos_z
    :reader tag_pos_z
    :initarg :tag_pos_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass Apriltag_info (<Apriltag_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Apriltag_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Apriltag_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name referee_msgs-msg:<Apriltag_info> is deprecated: use referee_msgs-msg:Apriltag_info instead.")))

(cl:ensure-generic-function 'tag_num-val :lambda-list '(m))
(cl:defmethod tag_num-val ((m <Apriltag_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader referee_msgs-msg:tag_num-val is deprecated.  Use referee_msgs-msg:tag_num instead.")
  (tag_num m))

(cl:ensure-generic-function 'tag_pos_x-val :lambda-list '(m))
(cl:defmethod tag_pos_x-val ((m <Apriltag_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader referee_msgs-msg:tag_pos_x-val is deprecated.  Use referee_msgs-msg:tag_pos_x instead.")
  (tag_pos_x m))

(cl:ensure-generic-function 'tag_pos_y-val :lambda-list '(m))
(cl:defmethod tag_pos_y-val ((m <Apriltag_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader referee_msgs-msg:tag_pos_y-val is deprecated.  Use referee_msgs-msg:tag_pos_y instead.")
  (tag_pos_y m))

(cl:ensure-generic-function 'tag_pos_z-val :lambda-list '(m))
(cl:defmethod tag_pos_z-val ((m <Apriltag_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader referee_msgs-msg:tag_pos_z-val is deprecated.  Use referee_msgs-msg:tag_pos_z instead.")
  (tag_pos_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Apriltag_info>) ostream)
  "Serializes a message object of type '<Apriltag_info>"
  (cl:let* ((signed (cl:slot-value msg 'tag_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tag_pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tag_pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tag_pos_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Apriltag_info>) istream)
  "Deserializes a message object of type '<Apriltag_info>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_num) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tag_pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tag_pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tag_pos_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Apriltag_info>)))
  "Returns string type for a message object of type '<Apriltag_info>"
  "referee_msgs/Apriltag_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Apriltag_info)))
  "Returns string type for a message object of type 'Apriltag_info"
  "referee_msgs/Apriltag_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Apriltag_info>)))
  "Returns md5sum for a message object of type '<Apriltag_info>"
  "2d3ba812331b080d7cb19d457f299caf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Apriltag_info)))
  "Returns md5sum for a message object of type 'Apriltag_info"
  "2d3ba812331b080d7cb19d457f299caf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Apriltag_info>)))
  "Returns full string definition for message of type '<Apriltag_info>"
  (cl:format cl:nil "int8 tag_num~%float32 tag_pos_x~%float32 tag_pos_y~%float32 tag_pos_z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Apriltag_info)))
  "Returns full string definition for message of type 'Apriltag_info"
  (cl:format cl:nil "int8 tag_num~%float32 tag_pos_x~%float32 tag_pos_y~%float32 tag_pos_z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Apriltag_info>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Apriltag_info>))
  "Converts a ROS message object to a list"
  (cl:list 'Apriltag_info
    (cl:cons ':tag_num (tag_num msg))
    (cl:cons ':tag_pos_x (tag_pos_x msg))
    (cl:cons ':tag_pos_y (tag_pos_y msg))
    (cl:cons ':tag_pos_z (tag_pos_z msg))
))
