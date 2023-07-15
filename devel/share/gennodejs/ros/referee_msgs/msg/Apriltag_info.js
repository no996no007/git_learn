// Auto-generated. Do not edit!

// (in-package referee_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Apriltag_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tag_num = null;
      this.tag_pos_x = null;
      this.tag_pos_y = null;
      this.tag_pos_z = null;
    }
    else {
      if (initObj.hasOwnProperty('tag_num')) {
        this.tag_num = initObj.tag_num
      }
      else {
        this.tag_num = 0;
      }
      if (initObj.hasOwnProperty('tag_pos_x')) {
        this.tag_pos_x = initObj.tag_pos_x
      }
      else {
        this.tag_pos_x = 0.0;
      }
      if (initObj.hasOwnProperty('tag_pos_y')) {
        this.tag_pos_y = initObj.tag_pos_y
      }
      else {
        this.tag_pos_y = 0.0;
      }
      if (initObj.hasOwnProperty('tag_pos_z')) {
        this.tag_pos_z = initObj.tag_pos_z
      }
      else {
        this.tag_pos_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Apriltag_info
    // Serialize message field [tag_num]
    bufferOffset = _serializer.int8(obj.tag_num, buffer, bufferOffset);
    // Serialize message field [tag_pos_x]
    bufferOffset = _serializer.float32(obj.tag_pos_x, buffer, bufferOffset);
    // Serialize message field [tag_pos_y]
    bufferOffset = _serializer.float32(obj.tag_pos_y, buffer, bufferOffset);
    // Serialize message field [tag_pos_z]
    bufferOffset = _serializer.float32(obj.tag_pos_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Apriltag_info
    let len;
    let data = new Apriltag_info(null);
    // Deserialize message field [tag_num]
    data.tag_num = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [tag_pos_x]
    data.tag_pos_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tag_pos_y]
    data.tag_pos_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tag_pos_z]
    data.tag_pos_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'referee_msgs/Apriltag_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2d3ba812331b080d7cb19d457f299caf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 tag_num
    float32 tag_pos_x
    float32 tag_pos_y
    float32 tag_pos_z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Apriltag_info(null);
    if (msg.tag_num !== undefined) {
      resolved.tag_num = msg.tag_num;
    }
    else {
      resolved.tag_num = 0
    }

    if (msg.tag_pos_x !== undefined) {
      resolved.tag_pos_x = msg.tag_pos_x;
    }
    else {
      resolved.tag_pos_x = 0.0
    }

    if (msg.tag_pos_y !== undefined) {
      resolved.tag_pos_y = msg.tag_pos_y;
    }
    else {
      resolved.tag_pos_y = 0.0
    }

    if (msg.tag_pos_z !== undefined) {
      resolved.tag_pos_z = msg.tag_pos_z;
    }
    else {
      resolved.tag_pos_z = 0.0
    }

    return resolved;
    }
};

module.exports = Apriltag_info;
