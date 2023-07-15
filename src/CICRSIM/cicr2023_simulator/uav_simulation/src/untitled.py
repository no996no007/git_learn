import rospy
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import GetModelState
from nav_msgs.msg import Odometry
import numpy as np
import math
rospy.init_node('control')
model_odom_pub = rospy.Publisher('/position_control',Odometry,queue_size=10)
get_model_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
body_pose_msg = ModelState() 
last_body_pose_msg = ModelState() 
odom = Odometry()

def speedset(double xx,double yy):
    drone_state = get_model_state('ardrone','world')
    float speed_x
    float speed_y
    abs_distance_x=abs(xx-drone_state.pose.position.x)
    abs_distance_y=abs(yy-drone_state.pose.position.y)
    if (abs_distance_x>abs_distance_y):
        speed_x=(xx-drone_state.pose.position.x)/abs_distance_x*3
        speed_y=(yy-drone_state.pose.position.y)/abs_distance_x*3
    else:
        speed_x=(xx-drone_state.pose.position.x)/abs_distance_y*3
        speed_y=(yy-drone_state.pose.position.y)/abs_distance_y*3

    odom.pose.pose.position.x = drone_state.pose.position.x
    odom.pose.pose.position.y = drone_state.pose.position.y
    odom.pose.pose.position.z = drone_state.pose.position.z

    odom.pose.pose.orientation.w = drone_state.pose.orientation.w
    odom.pose.pose.orientation.x = drone_state.pose.orientation.x
    odom.pose.pose.orientation.y = drone_state.pose.orientation.y
    odom.pose.pose.orientation.z = drone_state.pose.orientation.z

    odom.twist.twist.linear.x = speed_x
    odom.twist.twist.linear.y = speed_y
    odom.twist.twist.linear.z = 0

    odom.twist.twist.angular.x = drone_state.twist.angular.x
    odom.twist.twist.angular.y = drone_state.twist.angular.y
    odom.twist.twist.angular.z = drone_state.twist.angular.z

    model_odom_pub.publish(odom)