#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import GetModelState
from nav_msgs.msg import Odometry
import numpy as np
import math
import tf.transformations as tft
import rospy
from sensor_msgs.msg import PointCloud2
from sensor_msgs.msg import PointField
from sensor_msgs import point_cloud2
import numpy as np

rospy.init_node('control&Point_cloud')
model_odom_pub = rospy.Publisher('/position_control',Odometry,queue_size=10)
get_model_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
body_pose_msg = ModelState() #uav body pose
last_body_pose_msg = ModelState() 
odom = Odometry()

#要用时才请求/velodyne_points发布的点云数据 这里不知道ServiceProxy能不能用 不能的话就改成subscribe
point_cloud_get = rospy.ServiceProxy('/velodyne_points',PointCloud2)

#这个是点云滤波范围 
float distance = 0.3

#方向归一化函数 (x,y)返回(1，y/x) 若abs(x)>abs(y)
def speed_tran(speedx,speedy):
  if abs(speedx)!=0 && abs(speedy)!=0:
    Max=max(abs(speedx),abs(speedy))
    return (speedx/Max,speedy/Max)
  else:
    return(0,0)

#中心坐标与当前坐标连线方向计算函数
def centre_link()
  i=0
  float x_sum=0
  float y_sum=0
  data=point_cloud_get()
  points = point_cloud2.read_points(data, field_names=("x", "y", "z"), skip_nans=True)
  for p in points:
    if pow((p[0]-drone_state.pose.position.x),2)+pow((p[1]-drone_state.pose.position.y),2)<distance:
      x_sum=x_sum+p[0]
      y_sum=y_sum+p[1]
      i=i+1
  #如果没有点在范围内 link=(0,0) 这会导致direct=(0,0) backdir=(0,0) 即不对当前速度产生影响
  if x_sum==0 && y_sum==0:
    return(0,0)
  else:
    centre_point=(x_sum/i,y_sum/i)
    Link=(centre_point[0]-drone_state.pose.position.x,centre_point[1]-drone_state.pose.position.y)
    return Link
#速度设置的函数
def speedset(double xx,double yy):

#朝向目标点速度方向
  drone_state = get_model_state('ardrone','world')
  Dir=speed_tran(xx-drone_state.pose.position.x,yy-drone_state.pose.position.y)

  #计算连接方向
  link=centre_link()
  
  #远离障碍物速度方向
  backdir=(-link[0],-link[1])

  #判断绕行障碍物速度方向
  if (Dir[0]*link[1]-Dir[1]*link[0])>0:
    direct=(link[1],-link[0])
  else:
    direct=(-link[1],link[0])

  #速度为：归一化（归一化朝向目标速度方向+归一化绕行障碍物速度方向+归一化远离障碍物速度方向）*3
  speed_xy=speed_tran(speed_tran(direct)+speed_tran(backdir)+Dir)*3
  
  odom.pose.pose.position.x = drone_state.pose.position.x
  odom.pose.pose.position.y = drone_state.pose.position.y
  odom.pose.pose.position.z = drone_state.pose.position.z

  odom.pose.pose.orientation.w = drone_state.pose.orientation.w
  odom.pose.pose.orientation.x = drone_state.pose.orientation.x
  odom.pose.pose.orientation.y = drone_state.pose.orientation.y
  odom.pose.pose.orientation.z = drone_state.pose.orientation.z

  odom.twist.twist.linear.x = speed_xy[0]
  odom.twist.twist.linear.y = speed_xy[1]
  odom.twist.twist.linear.z = 0

  odom.twist.twist.angular.x = drone_state.twist.angular.x
  odom.twist.twist.angular.y = drone_state.twist.angular.y
  odom.twist.twist.angular.z = drone_state.twist.angular.z

  model_odom_pub.publish(odom)

