#include "ros/ros.h"
#include "apriltag_ros/AprilTagDetectionArray.h"
#include <iostream>
#include <ros/ros.h>
#include <referee_msgs/Apriltag_info.h>
#include <geometry_msgs/PoseStamped.h>
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/ModelState.h>
ros::ServiceClient client;
ros::Publisher tag_pub;



void tagPub(double x,double y,double z,int id)
{
    referee_msgs::Apriltag_info msg;
    msg.tag_num = id;
    msg.tag_pos_x = x;
    msg.tag_pos_y = y;
    msg.tag_pos_z = z;
    printf("pub x=%f y=%f z=%f id=%d\n",x,y,z,id);
    tag_pub.publish(msg);
}

void callback(apriltag_ros::AprilTagDetectionArray msg)
{

    if(msg.detections.empty())
    {
        printf("size = 0\n");
    }
    else
    {
        printf("size = ?\n");
        printf("id = %d\n",msg.detections[0].id[0]);
        printf("rx = %f\n",msg.detections[0].pose.pose.pose.position.x);
        printf("ry = %f\n",msg.detections[0].pose.pose.pose.position.y);
        printf("rz = %f\n",msg.detections[0].pose.pose.pose.position.z);
        
        int id = msg.detections[0].id[0];
        double rx = msg.detections[0].pose.pose.pose.position.x;        
        double ry = msg.detections[0].pose.pose.pose.position.y;
        double rz = msg.detections[0].pose.pose.pose.position.z;

        gazebo_msgs::GetModelState uav;
        uav.request.model_name = "ardrone";
        uav.request.relative_entity_name = "world";
        double dronex;
        double droney;
        double dronez;
        if(client.call(uav))
        {
            dronex = uav.response.pose.position.x;
            droney = uav.response.pose.position.y;
            dronez = uav.response.pose.position.z;
        }

        double tx = dronex - rz - 0.11 - uav.response.twist.linear.x*0.3;
        double ty = droney + rx - 0.02 - uav.response.twist.linear.y*0.3;
        double tz = dronez - ry + 0.15 - uav.response.twist.linear.z*0.3;
        
        tagPub(tx,ty,tz,id);
    }
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "detector");
    ros::NodeHandle nh;
    client = nh.serviceClient<gazebo_msgs::GetModelState>("/gazebo/get_model_state");
    ros::Subscriber sub = nh.subscribe("/tag_detections",1,callback);
    ROS_INFO("detector node starting\n");
    ros::Rate loop_rate(10);


    // 一直发布坐标
    tag_pub = nh.advertise<referee_msgs::Apriltag_info>("/apriltag_detection",10);

    while(ros::ok())
    {
        ros::spinOnce();//这个函数的作用是在为while循环内不断地查看是否有有新消息。不调用是更新不了消息的。
        loop_rate.sleep();
    }
    return 0;
}