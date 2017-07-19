#!/bin/bash

# init
sudo exec "$@"

#enable ssh server
sudo service ssh start

#vncserver
USER=ute
HOME=/home/ute
export USER HOME

#resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}

##change vnc password
#echo "change vnc password!"
#(echo $VNC_PW && echo $VNC_PW) | vncpasswd

##start vncserver webclient
vncserver -kill :1
rm -rf /tmp/.X1-lock
rm -rfv /tmp/.X11-unix/* ; echo "remove old vnc locks to be a reattachable container"
echo -e "vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION"
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
sleep 1
##log connect options
echo -e "\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"

#modify for wireshark
sudo cp -rf /home/ute/.Xauthority /home/scpadm/
sudo chown scpadm:scpadm -R /home/scpadm/.Xauthority

# keep container running on daemon
tail -f /dev/null
