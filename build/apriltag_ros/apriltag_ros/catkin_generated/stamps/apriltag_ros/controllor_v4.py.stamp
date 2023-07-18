#!/usr/bin/env python3
import rospy
import rosnode
import math
import numpy as np
import tf.transformations as tft
from nav_msgs.msg import Odometry
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import GetModelState
from sensor_msgs.msg import PointCloud2
from sensor_msgs.msg import PointField
from sensor_msgs import point_cloud2

model_odom_pub = rospy.Publisher('/position_control',Odometry,queue_size=10)
get_model_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
#要用时才请求/velodyne_points发布的点云数据 这里不知道ServiceProxy能不能用 不能的话就改成subscribe
point_cloud_get = rospy.ServiceProxy('/velodyne_points',PointCloud2)
body_pose_msg = ModelState() #uav body pose
last_body_pose_msg = ModelState() 
drone_state = get_model_state('ardrone','world')
odom = Odometry()
#这个是点云滤波范围 
distance = 0.64

def sgn(x):
    if x > 0:
        return 1
    elif x == 0:
        return 0
    else:
        return -1

#中心坐标与当前坐标连线方向计算函数
def centre_link():
  i=0
  Kp=1.5/0.2
  x_sum=0
  y_sum=0
  data=point_cloud_get()
  points = point_cloud2.read_points(data, field_names=("x", "y", "z"), skip_nans=True)
  for p in points:
    if pow((p[0]-drone_state.pose.position.x),2)+pow((p[1]-drone_state.pose.position.y),2)<pow(distance,2):
      x_sum=x_sum+p[0]
      y_sum=y_sum+p[1]
      i=i+1
  #如果没有点在范围内 link=(0,0) 这会导致direct=(0,0) backdir=(0,0) 即不对当前速度产生影响
  if x_sum==0 & y_sum==0:
    return(0,0)
  else:
    centre_point=(x_sum/i,y_sum/i)
    Link=(sgn(centre_point[0]-drone_state.pose.position.x)*1.5*(1-abs(centre_point[0]-drone_state.pose.position.x)/distance),
          sgn(centre_point[1]-drone_state.pose.position.y)*1.5*(1-abs(centre_point[1]-drone_state.pose.position.y)/distance))
    return Link

#速度设置的函数
def speedset(xd,yd,zd):
    Kp=1.5/0.2 # 即在x米以内才开始减速，其他时候全速(为3)前进！
    x_speed=xd*Kp
    y_speed=yd*Kp
    z_speed=zd*Kp
    max_speed=max(np.abs([x_speed,y_speed,z_speed]))
    if(abs(max_speed)>1.5):
        x_speed=1.5*x_speed/abs(max_speed)
        y_speed=1.5*y_speed/abs(max_speed)
        z_speed=1.5*z_speed/abs(max_speed)
    else:
        x_speed=x_speed*abs(x_speed)/abs(max_speed)
        y_speed=y_speed*abs(y_speed)/abs(max_speed)
        z_speed=z_speed*abs(z_speed)/abs(max_speed)
    return(x_speed,y_speed,z_speed)
  


current_point=0
checkpoints=[
    [9.8,3.6,1.95],
    [9.3,1.0,1.95],
    [8.8,-3.0,1.95],
    [6.9,-3.2,1.95],
    [6.0,-5.2,1.95],
    [3.06,-4.0,1.95],
    [-2.9,-4.6,1.95],
    [-4.9,-4.6,1.95],
    [-9.5,-3.6,1.95],
    [-9.5,-1.6,1.95],
    [-6.0,-1.6,1.95],
    [-6.0,0.5,1.95],
    [-8.5,1.6,1.95],
    [-7.5,5.0,1.95],
    [-2.5,5.3,1.95],
    [1.38,5.3,1.95],
    [3.00,5.3,1.95],
    [5.50,3.90,1.95],
    [5.50,1.50,1.95],
    [8.40,1.50,1.95]
]

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

# 以下为功能函数

# 设置世界坐标系的速度
def set_body_zlinear_speed(z):
    global odom,drone_state,body_pose_msg,last_body_pose_msg
    body_pose_msg.twist.linear.z = z
    last_body_pose_msg.twist.linear.z = body_pose_msg.twist.linear.z

def set_body_xlinear_speed(x):
    global odom,drone_state,body_pose_msg,last_body_pose_msg
    body_pose_msg.twist.linear.x = x
    last_body_pose_msg.twist.linear.x = body_pose_msg.twist.linear.x

def set_body_ylinear_speed(y):
    global odom,drone_state,body_pose_msg,last_body_pose_msg
    body_pose_msg.twist.linear.y = y
    last_body_pose_msg.twist.linear.y = body_pose_msg.twist.linear.y

# 给予一个指定点与偏航角，用P控制直线运动到世界坐标系的某点
def set_world_linear_by_dst_point(xyzo):
    global odom,drone_state,body_pose_msg,last_body_pose_msg
    xx=xyzo[0]
    yy=xyzo[1]
    zz=xyzo[2]
    # pp=xyzp[2]
    drone_state = get_model_state('ardrone','world')
    x=0.2
    Kp=1.5/x # 即在x米以内才开始减速，其他时候全速(为3)前进！
    xd=xx-drone_state.pose.position.x
    yd=yy-drone_state.pose.position.y
    zd=zz-drone_state.pose.position.z
    speedxyz=speedset(xd,yd,zd)
    
    LK=centre_link()#计算连接方向
    link=speedset(LK[0],LK[1],0)
    backdir=(-link[0],-link[1])#远离障碍物速度方向

    #判断绕行障碍物速度方向
    if (speedxyz[0]*link[1]-speedxyz[1]*link[0])>0:
        direct=(link[1],-link[0])
    else:
        direct=(-link[1],link[0])

    speedXYZ=speedset(speedxyz[0]+direct[0]+backdir[0],
                      speedxyz[1]+direct[1]+backdir[1],
                      speedxyz[2])

    odom.twist.twist.linear.x = speedXYZ[0]
    odom.twist.twist.linear.y = speedXYZ[1]
    odom.twist.twist.linear.z = speedXYZ[2]

    quaternion_uav = (drone_state.pose.orientation.w, drone_state.pose.orientation.x, drone_state.pose.orientation.y, drone_state.pose.orientation.z)
    euler_angles = tft.euler_from_quaternion(quaternion_uav, 'sxyz') # yaw
    if(euler_angles[0]>=0):
        uav_yaw = math.pi - euler_angles[0]
    if(euler_angles[0]<0):
        uav_yaw = -math.pi - euler_angles[0]
    
    # print(uav_yaw,"\n")

    odom.twist.twist.angular.x = drone_state.twist.angular.x
    odom.twist.twist.angular.y = drone_state.twist.angular.y
    if(abs(uav_yaw)<3.13):
        odom.twist.twist.angular.z = 2*abs(3.141592-abs(uav_yaw))*uav_yaw/abs(uav_yaw) # 暂时使它一直朝向yaw=3.14的位置

    if (max(np.abs([xd,yd,zd]))<0.03): # 最大距离差小于0.05判断为到达目的
        return True
    else:
        return False

# 维护无人机状态时，只需要维护修改的速度状态，位置状态不需要被修改，读了什么就设置为什么。
def keep_model_position():
    global odom,drone_state,body_pose_msg,last_body_pose_msg
    odom.pose.pose.position.x = drone_state.pose.position.x
    odom.pose.pose.position.y = drone_state.pose.position.y
    odom.pose.pose.position.z = drone_state.pose.position.z

    odom.pose.pose.orientation.w = drone_state.pose.orientation.w
    odom.pose.pose.orientation.x = drone_state.pose.orientation.x
    odom.pose.pose.orientation.y = drone_state.pose.orientation.y
    odom.pose.pose.orientation.z = drone_state.pose.orientation.z

# 修改物体坐标系下的速度变量后调用，该函数将依据物体坐标系下的速度覆写相对应的世界坐标系速度
def set_world_twist_by_body_speed():
    #--------------------------------------------------
    # 以下部分完全从keyboard中copy的，进行一些发布前的设置，不需要做更改。
    # orientation ---> euler
    global odom,drone_state,body_pose_msg,last_body_pose_msg
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

    #这个文件只修改无人机的速度
    odom.twist.twist.linear.x = world_vel_matrix[0]
    odom.twist.twist.linear.y = world_vel_matrix[1]
    odom.twist.twist.linear.z = world_vel_matrix[2]

    odom.twist.twist.angular.x = drone_state.twist.angular.x
    odom.twist.twist.angular.y = drone_state.twist.angular.y
    odom.twist.twist.angular.z = last_body_pose_msg.twist.angular.z
    #--------------------------------------------------


if __name__ == '__main__':
    try:
        # 这个全局变量要声明一下！
        rospy.init_node('controller')
        rospy.logwarn("controller loaded!!!!\n")
        rosnode.kill_nodes(['keyboard_control'])
        # rosnode.
        rate = rospy.Rate(10000)

        while not rospy.is_shutdown():
            # rospy.sleep(0.01)
            # rospy.loginfo("controller running")
            drone_state = get_model_state('ardrone','world')
            # print(drone_state.pose.orientation.z,"\n")
            # print(odom.pose.pose.position.x)

            #------------------------------------------------------
            # 这个控制器只需要对以下几个变量进行修改即可实现运动控制！！
            # 这个body_pose_msg与是无人机的坐标系下的xyz轴的方向的平动速度与轴速度！！！
            # 想让它速度为多少从这下面开始写

            is_checked = set_world_linear_by_dst_point(checkpoints[current_point])
            if(is_checked): # 如果到了下次就去下一个点
                current_point+=1
                current_point%=len(checkpoints)
                print(current_point)
            # body_pose_msg.twist.linear.z = 3
            # last_body_pose_msg.twist.linear.z = body_pose_msg.twist.linear.z

            #------------------------------------------------------
            # 根据世界坐标系的速度发布修改
            keep_model_position()
            # print(odom.pose.pose.position.x)
            model_odom_pub.publish(odom)
            rate.sleep()

    except rospy.ROSInterruptException:
        pass

