#!/bin/sh

# init
service dbus start
service ssh start 

#--------start vncserver--------
#delete lock
rm -rf /tmp/.X*
Xvfb :0 -nolisten tcp -auth /var/run/gdm3/auth-for-Debian-gdm-3uOEuD/database -screen 0 $VNC_RESOLUTION"x24" >~/.vnc/xvfb.log 2>&1 &
/usr/bin/x11vnc -env X11VNC_WATCH_DX_DY=1 -geometry $VNC_RESOLUTION -repeat -shared -display :0 -24to32 -auth /var/run/gdm3/auth-for-Debian-gdm-3uOEuD/database -o ~/.vnc/x11vnc.log -forever -bg

# switch to ute
su - ute <<EOF
sudo service rpcbind start
/usr/bin/ssh-agent /usr/bin/dbus-launch --exit-with-session x-session-manager&
EOF

#p -rf /home/ute/.Xauthority /root/
#cp -rf /root/.Xauthority /home/scpadm/
#chown scpadm:scpadm -R /home/scpadm/.Xauthority

echo "ServerName localhost" >> /etc/apache2/apache2.conf
echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/servername.conf
service apache2 start

# keep container running on daemon
tail -f /dev/null
