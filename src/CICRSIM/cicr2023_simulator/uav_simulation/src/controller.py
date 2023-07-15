#! /usr/bin/env python
import rospy
import math
import numpy as np
import tf.transformations as tft
from nav_msgs.msg import Odometry
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import GetModelState

def main():
    rospy.init_node('controller')
    rospy.logwarn("controller loaded!!!!\n")
    model_odom_pub = rospy.Publisher('/position_control',Odometry,queue_size=10)
    get_model_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
    body_pose_msg = ModelState() #uav body pose
    last_body_pose_msg = ModelState() #
    rate = rospy.Rate(10000)
    odom = Odometry()
    while not rospy.is_shutdown():
        rospy.loginfo("controller running")
        drone_state = get_model_state('ardrone','world')

        #------------------------------------------------------
        # 这个控制器只需要对以下几个变量进行修改即可实现运动控制！！

        # 这个body_pose_msg与是无人机的坐标系下的xyz轴的方向的平动速度与轴速度！！！
        # 初始化全部置0
        body_pose_msg.twist.linear.x = 0
        body_pose_msg.twist.linear.y = 0
        body_pose_msg.twist.linear.z = 0
        last_body_pose_msg.twist.linear.x = body_pose_msg.twist.linear.x
        last_body_pose_msg.twist.linear.y = body_pose_msg.twist.linear.y
        last_body_pose_msg.twist.linear.z = body_pose_msg.twist.linear.z

        body_pose_msg.twist.angular.x = 0
        body_pose_msg.twist.angular.y = 0
        body_pose_msg.twist.angular.z = 0
        last_body_pose_msg.twist.angular.x = body_pose_msg.twist.angular.x
        last_body_pose_msg.twist.angular.y = body_pose_msg.twist.angular.y
        last_body_pose_msg.twist.angular.z = body_pose_msg.twist.angular.z

        # 想让它速度为多少从这下面开始写
        body_pose_msg.twist.linear.z = 3
        last_body_pose_msg.twist.linear.z = body_pose_msg.twist.linear.z

        #------------------------------------------------------



        #--------------------------------------------------
        # 以下部分完全从keyboard中copy的，进行一些发布前的设置，不需要做更改。
        # orientation ---> euler
        quaternion_uav = (drone_state.pose.orientation.w, drone_state.pose.orientation.x, drone_state.pose.orientation.y, drone_state.pose.orientation.z)
        euler_angles = tft.euler_from_quaternion(quaternion_uav, 'sxyz') # yaw
        if(euler_angles[0]>=0):
            uav_yaw = math.pi - euler_angles[0]
        if(euler_angles[0]<0):
            uav_yaw = -math.pi - euler_angles[0]

        # body ---> world
        rotation_matrix_z = np.matrix([[math.cos(uav_yaw),-math.sin(uav_yaw),0],[math.sin(uav_yaw),math.cos(uav_yaw),0],[0,0,1]])
        body_vel_matrix = np.matrix([last_body_pose_msg.twist.linear.x, last_body_pose_msg.twist.linear.y, last_body_pose_msg.twist.linear.z])
        body_vel_matrix_trans = body_vel_matrix.T
        world_vel_matrix = rotation_matrix_z.dot(body_vel_matrix_trans)

        #这个文件只修改无人机的速度，所以维护无人机状态时，只需要维护修改的速度状态，位置状态不需要被修改，读了什么就设置为什么。
        odom.pose.pose.position.x = drone_state.pose.position.x
        odom.pose.pose.position.y = drone_state.pose.position.y
        odom.pose.pose.position.z = drone_state.pose.position.z

        odom.pose.pose.orientation.w = drone_state.pose.orientation.w
        odom.pose.pose.orientation.x = drone_state.pose.orientation.x
        odom.pose.pose.orientation.y = drone_state.pose.orientation.y
        odom.pose.pose.orientation.z = drone_state.pose.orientation.z

        odom.twist.twist.linear.x = world_vel_matrix[0]
        odom.twist.twist.linear.y = world_vel_matrix[1]
        odom.twist.twist.linear.z = world_vel_matrix[2]

        odom.twist.twist.angular.x = drone_state.twist.angular.x
        odom.twist.twist.angular.y = drone_state.twist.angular.y
        odom.twist.twist.angular.z = last_body_pose_msg.twist.angular.z

        model_odom_pub.publish(odom)
        rate.sleep()
        
        #--------------------------------------------------



if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass