#include <ros/ros.h>
#include <std_msgs/Bool.h>
ros::Publisher start_flag_pub;
void startflagPub()
{
  ros::Rate loop_rate(10);
  while(ros::ok())
  {
    std_msgs::Bool my_start_flag;
    my_start_flag.data = true;
    start_flag_pub.publish(my_start_flag);
    loop_rate.sleep();
    printf("trigger!\n");
  }
}
int main(int argc, char** argv)
{
  ros::init(argc, argv, "start_trigger");
  ros::NodeHandle nh;
  start_flag_pub = nh.advertise<std_msgs::Bool>("/start_flag",10);
  startflagPub();
}