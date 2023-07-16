#include <ros/ros.h>
#include <sensor_msgs/Image.h>
 void depthImageCallback(const sensor_msgs::Image::ConstPtr& msg)
{
    // 处理深度图像消息
}
 int main(int argc, char** argv)
{
    ros::init(argc, argv, "depth_image_subscriber");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<sensor_msgs::Image>("/camera/depth/image_raw", 1, depthImageCallback);
    ros::spin();
}