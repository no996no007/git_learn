

#include <std_msgs/String.h>
#include <ros/ros.h>

int main(int argc, char *argv[])
{
    /* code */
    ros::init(argc,argv,"chao");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<std_msgs::String>("chaos_topic",10);

    ros::Rate loop_rate(10);

    while(ros::ok())
    {
        printf("chao is here\n");
        std_msgs::String msg;
        msg.data = "chao is speaking!";
        pub.publish(msg);
        loop_rate.sleep();
    }
    return 0;
}
