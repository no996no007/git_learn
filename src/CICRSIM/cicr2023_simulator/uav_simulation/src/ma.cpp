#include<ros/ros.h>
#include<std_msgs/String.h>

void chao_callback(std_msgs::String msg)
{
    ROS_INFO(msg.data.c_str());
    // printf("\n");
}
void yao_callback(std_msgs::String msg)
{
    ROS_INFO(msg.data.c_str());
    // printf("\n");
}

int main(int argc, char *argv[])
{
    /* code */
    ros::init(argc,argv,"ma");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("chaos_topic",10,chao_callback);
    ros::Subscriber sub_2 = nh.subscribe("yaos_topic",10,yao_callback);

    ros::Rate loop_rate(10);

    while(ros::ok())
    {
        ros::spinOnce();//这个函数的作用是在为while循环内不断地查看是否有有新消息。不调用是更新不了消息的。
        // printf("ma is here\n");
        loop_rate.sleep();
    }
    return 0;
}