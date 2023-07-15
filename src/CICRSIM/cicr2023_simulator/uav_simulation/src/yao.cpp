#include <ros/ros.h>
#include <std_msgs/String.h>
int main(int argc, char *argv[])
{
    /* code */
    ros::init(argc,argv,"yao");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<std_msgs::String>("yaos_topic",10);

    ros::Rate loop_rate(10);

    while(ros::ok())
    {
        printf("yao is here\n");
        std_msgs::String msg;
        msg.data = "yao is speaking!";
        pub.publish(msg);
        loop_rate.sleep();
    }
    return 0;
}
