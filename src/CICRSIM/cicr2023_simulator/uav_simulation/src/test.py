import numpy

x_speed=0.3
y_speed=0.2
z_speed=-0.4

if (max(numpy.abs([x_speed,y_speed,z_speed]))<0.01):
    print(max(numpy.abs([x_speed,y_speed,z_speed])))
else:
    print(max(numpy.abs([x_speed,y_speed,z_speed])))